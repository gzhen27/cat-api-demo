//
//  CatBreed.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/26/22.
//

import Foundation

class CatBreed: ObservableObject {
    
    // MARK: - Constants
    let baseUrl = "https://api.thecatapi.com/v1"
    let path = "/breeds"
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    // MARK: - Property Wrappers
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Computing Variables
    var url: URL? {
        URL(string: "\(baseUrl)\(path)")
    }
    
    // MARK: - LifeCycle
    init() {}
    
    
    // MARK: - Functions
    func fetchAll() {
        guard let url = url else {
            return
        }
        
        isLoading = true
        session.dataTask(with: url) { [unowned self] data, res, err in
            
            // returns when there is any error
            if let _ = err {
                return
            }
            
            // returns when the response status code is not 200
            guard let res = res as? HTTPURLResponse, res.statusCode == 200 else {
                return
            }
            
            // returns if data is missing
            guard let data = data else { return }
            
            do {
                let breeds = try decoder.decode([Breed].self, from: data)
                self.breeds = breeds
            } catch {
                return
            }
            
            self.isLoading = false
        }
    }
    
}
