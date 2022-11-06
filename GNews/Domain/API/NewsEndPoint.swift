//
//  NewsEndPoint.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/06.
//
import Foundation
///
// MARK: ------------------------- APIBuilderProtocol
///
///
///
protocol APIBuilderProtocol {
    ///
    var urlRequest: URLRequest { get }
    ///
    var baseUrl: URL { get }
    ///
    var apiKey: String { get }
    ///
    var sortOrder: String { get }
    ///
    var newsDate: String { get }
}
///
// MARK: ------------------------- NewsAPI
///
/// To get news, used Google news API.
/// It needs an account and an API key to get news.
/// Used developer mode account and it's allowed only 100 requests per day.
/// So, it's better to use your own API key 🙇🏽
/// [Refer this Google news API for more details](https://newsapi.org/)
///
enum NewsAPI {
    // TODO: Make more news types such as google, apple etc...
    ///
    case getNews
}
///
// MARK: ------------------------- Extension for NewsAPI
///
///
///
extension NewsAPI: APIBuilderProtocol {
    ///
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl)
    }
    ///
    var baseUrl: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/everything"
        components.queryItems = [URLQueryItem]()
        ///
        switch self {
        case .getNews:
            components.queryItems?.append(URLQueryItem(name: "q", value: "all"))
        }
        ///
        components.queryItems?.append(URLQueryItem(name: "from", value: self.newsDate))
        components.queryItems?.append(URLQueryItem(name: "to", value: self.newsDate))
        components.queryItems?.append(URLQueryItem(name: "sortBy", value: self.sortOrder))
        components.queryItems?.append(URLQueryItem(name: "apiKey", value: self.apiKey))
        ///
        return components.url!
    }
    ///
    var apiKey: String {
        return "019123e12b1a4596bf222788bec4dc05"
    }
    ///
    var sortOrder: String {
        return "popularity"
    }
    ///
    var newsDate: String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: date)
    }
}
