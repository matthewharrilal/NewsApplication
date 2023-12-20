//
//  NewsModel.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/19/23.
//

import Foundation

struct Results: Decodable {
//    let status: String
//    let totalResults: Int
    let results: [Result]
}

struct Result: Decodable {
//    let article_id: String
    let title: String?
//    let description: String?
//    let content: String
    let link: String?
}
