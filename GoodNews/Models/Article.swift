//
//  Article.swift
//  GoodNews
//
//  Created by iphong on 23/07/2019.
//  Copyright © 2019 sowt. All rights reserved.
//

import Foundation

struct Article: Codable {
//    var author: String?
//    var content: String?
//    var description: String?
//    var publishedAt: String?
//    var source: Source?
//    var title: String?
//    var url: String?
//    var urlToImage: String?

    var title: String?
    var description: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}
