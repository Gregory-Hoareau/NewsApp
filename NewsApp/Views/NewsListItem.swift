//
//  NewsListItem.swift
//  NewsApp
//
//  Created by MacBook on 10/09/2022.
//

import SwiftUI

struct NewsListItem: View {
    var news: News
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: news.urlToImage)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 60)

            Text(news.title)
                .font(.headline)
        }
    }
}

struct NewsListItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsListItem(news: News(title: "Titre de la news", description: "Description de la news", url: "https://www.gizchina.com/2022/09/10/elon-musk-issues-another-notice-to-try-to-end-the-deal-with-twitter/", urlToImage: "https://www.gizchina.com/wp-content/uploads/images/2022/07/1_5ra7TE5oPqAG4nnLsNspug-1200x675.png"))
    }
}
