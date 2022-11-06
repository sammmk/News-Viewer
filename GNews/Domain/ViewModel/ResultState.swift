//
//  ResultState.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/06.
//
import Foundation
///
// MARK: ------------------------- ResultState
///
///
///
enum ResultState {
    ///
    case loading
    ///
    case success(content: [Article])
    ///
    case failure(error: Error)
}
