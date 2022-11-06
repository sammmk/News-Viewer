//
//  News.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/03.
//
import Foundation
///
// MARK: -------------------------  News
///
///
///
struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
///
// MARK: -------------------------  Article
///
///
///
struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}
///
// MARK: -------------------------  Source
///
///
///
struct Source: Codable {
    let id: String?
    let name: String
}
///
// MARK: ------------------------- extension for Article
///
///
///
extension Article {
    ///
    /// Dummy data for testing only
    ///
    static var dummyData: Article {
        .init(
            source: Source(id: "bbc-news", name: "BBC News"),
            author: "https://www.facebook.com/bbcnews",
            title: "US midterms: Why abortion matters in these crucial elections",
            articleDescription: "Inflation is voters' top issue, but Democrats hope anger over abortion bans will boost turnout.",
            url: "https://www.bbc.co.uk/news/world-us-canada-63434895",
            urlToImage: "https://ichef.bbci.co.uk/news/1024/branded_news/13E1/production/_125798050_hi076912464.jpg",
            publishedAt: "2022-11-06T00:58:18Z",
            content: "I met Susan Van Hoek at a pro-choice women's demonstration in Michigan's capital, Lansing. As she stood there with a placard, wearing her long grey hair loose, she remembered marching for abortion ri… [+7346 chars]"
        )
    }
}
