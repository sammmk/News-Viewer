//
//  APIError.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/06.
//
import Foundation
///
// MARK: ------------------------- APIError
///
///
///
enum APIError: Error {
    ///
    case decodingError
    ///
    case errorCode(Int)
    ///
    case unknown
}
///
// MARK: ------------------------- Extension for APIError
///
///
///
extension APIError: LocalizedError {
    ///
    var errorDescription: String? {
        switch self {
        ///
        case .decodingError:
            return "🔂 Failed to decode"
        ///
        case .errorCode(let code):
            switch code {
            case 400:
                return "\(code) - ⛔️ The request is invalid."
            case 401:
                return "\(code) - ☠️ API key invalid"
            default:
                return "\(code) - 🤷🏽 Something is not good"
            }
        ///
        case .unknown:
            return "😱 Unknown error occurred"
        }
    }
}
