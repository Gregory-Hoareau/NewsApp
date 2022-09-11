//
//  NewsListView.swift
//  NewsApp
//
//  Created by MacBook on 10/09/2022.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsListViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.news.count == 0 {
                Text("Aucun article n'a pu être chargé")
            } else {
                List {
                    ForEach(viewModel.news, id: \.title) { n in
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
        .onAppear {
            viewModel.retrieveAllNews()
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
