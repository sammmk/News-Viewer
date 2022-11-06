//
//  NewsService.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/03.
//
import Foundation
import Combine
///
// MARK: ------------------------- NewsServiceProtocol
///
///
///
protocol NewsServiceProtocol {
    func request(from endpoint: NewsAPI) -> AnyPublisher<News, APIError>
}
///
// MARK: -------------------------　NewsService
///
///
///
struct NewsService: NewsServiceProtocol {
    ///
    ///
    ///
    func request(from endpoint: NewsAPI) -> AnyPublisher<News, APIError> {
        ///
        print(endpoint.urlRequest)
        ///
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in
                APIError.unknown
            }
            .flatMap { data, response -> AnyPublisher<News, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: News.self, decoder: jsonDecoder)
                        .mapError { _ in
                            APIError.decodingError
                        }
                        .eraseToAnyPublisher()
                }
                else {
                    return Fail(error: APIError.errorCode(response.statusCode))
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
