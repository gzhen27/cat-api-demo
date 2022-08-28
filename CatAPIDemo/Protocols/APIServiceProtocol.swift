//
//  APIServiceProtocol.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import Foundation

protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
