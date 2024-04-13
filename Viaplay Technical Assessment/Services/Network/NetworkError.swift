//
//  NetworkError.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case generalError
    case invalidURL
    case invalidResponseStatus
    case jsonParsingFailed

    var errorDescription: String? {
        switch self {
        case .generalError: "Network general error"
        case .invalidURL: "Provided URL is not valid"
        case .invalidResponseStatus: "Response was not 200"
        case .jsonParsingFailed: "Failed to parse JSON to DTO"
        }
    }
}
