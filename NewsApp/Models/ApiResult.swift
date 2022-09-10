//
//  ApiResult.swift
//  NewsApp
//
//  Created by MacBook on 10/09/2022.
//

struct ApiResult: Decodable {
    var status: String
    var totalResults: Int
    var articles: [News]
}
