//
//  APIErrorMessages.swift
//  GNews
//
//  Created by Mohan Kurera on 2026/05/20.
//

import Foundation

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
            case 429:
                return "\(code) - ⌛️ You made too many requests within a window of time and have been rate limited. Back off for a while.😭"
            case 500:
                return "\(code) - 😱 Server Error, Something went wrong..."
            default:
                return "\(code) - 🤷🏽 Something is not good"
            }
        ///
        case .unknown:
            return "😱 Unknown error occurred"
        ///
        case .noArticles(let message):
            return "There are no articles \n \(message)"
        }
    }
}
