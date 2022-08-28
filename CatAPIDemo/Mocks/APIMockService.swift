//
//  APIMockService.swift
//  CatAPIDemoTests
//
//  Created by G Zhen on 8/27/22.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Breed], APIError>
    
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], APIError>) -> Void) {
        completion(result)
    }
    
}
