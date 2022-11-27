//
//  NewsViewModel.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/06.
//
import Foundation
import Combine
///
// MARK: ------------------------- NewsViewModelProtocol
///
///
///
protocol NewsViewModelProtocol {
    func getArticles()
}
///
// MARK: ------------------------- NewsViewModel
///
///
///
class NewsViewModel: ObservableObject, NewsViewModelProtocol {
    ///
    // MARK: ------------------------- properties
    ///
    ///
    ///
    private let service: NewsServiceProtocol
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    ///
    @Published private(set) var state: ResultState = .loading
    ///
    // MARK: -------------------------　Life cycle
    ///
    ///
    ///
    init(service: NewsServiceProtocol) {
        self.service = service
    }
    ///
    ///
    ///
    func getArticles() {
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink{ res in
                switch res {
                case .finished:
                    self.state = .success(content: self.articles)
                    
                case.failure(let error):
                    self.state = .failure(error: error)
                    
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        self.cancellables.insert(cancellable)
    }
}
