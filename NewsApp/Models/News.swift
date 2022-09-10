//
//  News.swift
//  NewsApp
//
//  Created by MacBook on 10/09/2022.
//

import Foundation

struct News: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var url: String
    var urlToImage: String
}
