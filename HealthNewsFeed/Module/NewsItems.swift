//
//  NewsItems.swift
//  HealthNewsFeed
//
//  Created by irena.omelana on 17/05/2023.
//

import Foundation

// MARK: - NewsItems
struct NewsItems: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
