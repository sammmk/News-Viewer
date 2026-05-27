//
//  GetNewsUseCase.swift
//  GNews
//
//  Created by Mohan Kurera on 2026/05/20.
//
import Foundation
///
// MARK: ------------------------- GetNewsUseCaseProtocol
///
///
///
protocol GetNewsUseCaseProtocol {
    func execute() async throws -> [Article]
}
///
// MARK: ------------------------- GetNewsUseCase
///
///
///
struct GetNewsUseCase: GetNewsUseCaseProtocol {
    ///
    private let repository: NewsRepositoryProtocol
    ///
    init(repository: NewsRepositoryProtocol = NewsRepository()) {
        self.repository = repository
    }
    ///
    func execute() async throws -> [Article] {
        try await repository.fetchArticles()
    }
}
