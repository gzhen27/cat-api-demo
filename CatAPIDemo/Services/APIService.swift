//
//  APIService.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import Foundation

struct APIService {
    
    // MARK: - Constants
    static let session = URLSession.shared
    static let decoder = JSONDecoder()
    
    // MARK: - Functions
    static func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void) {
        guard let url = url else {
            let err = APIError.badURL
            completion(Result.failure(err))
            return
        }

        session.dataTask(with: url) { data, res, err in
            if let err = err as? URLError {
                completion(Result.failure(APIError.url(err)))
            } else if let res = res as? HTTPURLResponse, res.statusCode != 200 {
                completion(Result.failure(APIError.badResponse(statusCode: res.statusCode)))
            } else if let data = data {
                do {
                    let breeds = try decoder.decode([Breed].self, from: data)
                    completion(Result.success(breeds))
                } catch {
                    completion(Result.failure(APIError.decoding(error as? DecodingError)))
                }
            }
        }
        .resume()
    }
    
}
