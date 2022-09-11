//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by MacBook on 10/09/2022.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var news: [News] = []
    let apiKey = "2d65599c71da446a9fb4f812c77684d4"
    
    func buildGetEverythingUrl() -> URL? {
        return URL(string: "https://newsapi.org/v2/everything?apiKey=\(apiKey)&language=fr&q=*")
    }
    
    func retrieveAllNews() {
        guard let url = buildGetEverythingUrl() else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse else { return }
            if error != nil || response.statusCode != 200 { return }
            
            var decodedResult = try! JSONDecoder().decode(ApiResult.self, from: data!)
            
            DispatchQueue.main.async {
                decodedResult.articles.removeFirst(2)
                self.news = decodedResult.articles
            }
        }.resume()
    }
    
}

