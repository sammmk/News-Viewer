//
//  NewsRepository.swift
//  GNews
//
//  Created by Mohan Kurera on 2026/05/20.
//
import Foundation
///
// MARK: ------------------------- NewsRepositoryProtocol
///
///
///
protocol NewsRepositoryProtocol {
    func fetchArticles() async throws -> [Article]
}
///
// MARK: ------------------------- NewsRepository
///
///
///
struct NewsRepository: NewsRepositoryProtocol {
    ///
    private let client: APIClient
    ///
    init(client: APIClient = APIClient()) {
        self.client = client
    }
    ///
    func fetchArticles() async throws -> [Article] {
        let news: News = try await client.request(from: NewsAPI.getNews)
        return news.articles
    }
}
