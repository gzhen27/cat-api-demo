//
//  APIError.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import Foundation

enum APIError: Error {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case decoding(DecodingError?)
    case unknown
}

extension APIError: CustomStringConvertible {
    
    var description: String {
        // for dev debugging
        switch self {
        case .badURL:
            return "invalid URL"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code: \(statusCode)"
        case .url(let err):
            return err?.localizedDescription ?? "url session error"
        case .decoding(let err):
            return "decoding error: \(err?.localizedDescription ?? "")"
        case .unknown:
            return "unknown error"
        }
    }
    
    var localizedDescription: String {
        // for user message
        switch self {
        case .badURL, .decoding:
            return "something went wrong."
        case .badResponse(_):
            return "our server is down, please try again later."
        case .url(let err):
            return err?.localizedDescription ?? "something went wrong."
        case .unknown:
            return "not able to get it, plase try again later."
        }
    }
    
}
