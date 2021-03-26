//
//  News.swift
//  TestNews
//
//  Created by macOS on 26.03.2021.
//

import Foundation

struct News: Decodable {
    let autor: String?
    let title: String?
    let desctiption: String?
    let urlToImage: String?
 }

struct NewsEnvelope: Decodable {
    let status: String
    let totalResult: Int
    let articles: [News]
}
