//
//  LiveNewsModel.swift
//  Viper-iOS-Two
//
//  Created by Gabriel on 13/07/21.
//

import Foundation

struct LiveNewsModel: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}
