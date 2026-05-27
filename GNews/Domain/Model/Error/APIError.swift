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
    ///
    case noArticles(String)
}
