//
//  NewsListView.swift
//  NewsApp
//
//  Created by MacBook on 10/09/2022.
//

import SwiftUI

struct NewsListView: View {
    @State private var news: [News] = [
        News(title: "Titre 1", description: "Description 1", url: "https://www.gizchina.com/2022/09/10/elon-musk-issues-another-notice-to-try-to-end-the-deal-with-twitter/", urlToImage: "https://www.gizchina.com/wp-content/uploads/images/2022/07/1_5ra7TE5oPqAG4nnLsNspug-1200x675.png"),
        News(title: "Titre 2", description: "Description 2", url: "https://www.gizchina.com/2022/09/10/elon-musk-issues-another-notice-to-try-to-end-the-deal-with-twitter/", urlToImage: "https://www.gizchina.com/wp-content/uploads/images/2022/07/1_5ra7TE5oPqAG4nnLsNspug-1200x675.png"),
        News(title: "Titre 3", description: "Description 3", url: "https://www.gizchina.com/2022/09/10/elon-musk-issues-another-notice-to-try-to-end-the-deal-with-twitter/", urlToImage: "https://www.gizchina.com/wp-content/uploads/images/2022/07/1_5ra7TE5oPqAG4nnLsNspug-1200x675.png")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(news) { n in
                    NavigationLink {
                        NewsDetail(news: n)
                    } label: {
                        NewsListItem(news: n)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Liste des articles")
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
