//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by MacBook on 10/09/2022.
//

import Foundation

extension NewsListView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var news: [News] = []
        private var apiKey = "2d65599c71da446a9fb4f812c77684d4"
        private var endpoint = "https://newsapi.org/v2/everything"
        
        func retrieveAllNews() {
            guard let url = URL(string: "\(endpoint)?apiKey=\(apiKey)&language=fr&q=*") else {
                return
            }
            
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
}
