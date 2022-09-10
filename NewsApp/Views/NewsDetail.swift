//
//  NewsDetail.swift
//  NewsApp
//
//  Created by MacBook on 10/09/2022.
//

import SwiftUI

struct NewsDetail: View {
    var news: News
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: news.urlToImage)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            Text(news.title)
                .font(.title)
                .bold()
            
            Text(news.description)
                .padding()
            
            Spacer()
            
            Link("Voir l'article complet", destination: URL(string: news.url)!)
        }
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsDetail(news: News(title: "Titre de la news", description: "Description de la news", url: "https://www.gizchina.com/2022/09/10/elon-musk-issues-another-notice-to-try-to-end-the-deal-with-twitter/", urlToImage: "https://www.gizchina.com/wp-content/uploads/images/2022/07/1_5ra7TE5oPqAG4nnLsNspug-1200x675.png"))
        }
    }
}
