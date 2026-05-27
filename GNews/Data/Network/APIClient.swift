//
//  APIClient.swift
//  GNews
//
//  Created by Mohan Kurera on 2026/05/20.
//
import Foundation
///
// MARK: ------------------------- APIClient
///
///
///
struct APIClient {
    ///
    func request<T: Decodable>(from endpoint: APIBuilderProtocol) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: endpoint.urlRequest)

        guard let http = response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        guard (200...299).contains(http.statusCode) else {
            throw APIError.errorCode(http.statusCode)
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            #if DEBUG
            print("⚠️ Decoding error: \(error)")
            #endif
            throw APIError.decodingError
        }
    }
}
