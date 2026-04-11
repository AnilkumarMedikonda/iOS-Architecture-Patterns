//
//  NetworkError.swift
//  MVVM-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(statusCode: Int)
    case unknown(Error)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .noData: return "No data received"
        case .decodingError: return "Failed to decode response"
        case .serverError(let code): return "Server error: \(code)"
        case .unknown(let error): return error.localizedDescription
        }
    }
}
