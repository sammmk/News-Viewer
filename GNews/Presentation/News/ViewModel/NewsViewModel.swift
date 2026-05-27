//
//  NewsViewModel.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/06.
//
import Foundation
///
// MARK: ------------------------- NewsViewModel
///
///
///
@MainActor
class NewsViewModel: ObservableObject {
    ///
    // MARK: ------------------------- Properties
    ///
    private let getNewsUseCase: GetNewsUseCaseProtocol
    private(set) var articles = [Article]()
    ///
    @Published private(set) var state: ResultState = .loading
    ///
    // MARK: ------------------------- Life cycle
    ///
    init(getNewsUseCase: GetNewsUseCaseProtocol = GetNewsUseCase()) {
        self.getNewsUseCase = getNewsUseCase
    }
    ///
    func getArticles() async {
        state = .loading
        do {
            let fetched = try await getNewsUseCase.execute()
            articles = fetched
            state = .success(content: fetched)
        } catch {
            state = .failure(error: error)
        }
    }
}
