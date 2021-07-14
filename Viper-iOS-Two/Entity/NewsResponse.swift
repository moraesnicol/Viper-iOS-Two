//
//  NewsResponse.swift
//  Viper-iOS-Two
//
//  Created by Gabriel on 13/07/21.
//

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let source: String?
    let sortBy: String?
    let articles: [LiveNewsModel]?
}
