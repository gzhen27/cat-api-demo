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
    init() {
        fetchAll()
    }
    
    
    // MARK: - Functions
    func fetchAll() {
        guard let url = url else {
            errorMessage = APIError.badURL.localizedDescription
            return
        }
        
        isLoading = true
        
        session.dataTask(with: url) { [unowned self] data, res, err in
            
            // returns when there is any error
            if let err = err {
                errorMessage = err.localizedDescription
                return
            }
            
            // returns when the response status code is not 200
            guard let res = res as? HTTPURLResponse, res.statusCode == 200 else {
                //TODO - get the statusCode and replace the 0 here
                errorMessage = APIError.badResponse(statusCode: 0).localizedDescription
                return
            }
            
            // returns if data is missing
            guard let breedData = data else {
                //TODO - get the statusCode and replace the 0 here
                errorMessage = APIError.badResponse(statusCode: 0).localizedDescription
                return
            }
            
            do {
                let breeds = try decoder.decode([Breed].self, from: breedData)
                print(breeds)
                
                DispatchQueue.main.async {
                    self.breeds = breeds
                    self.isLoading = false
                }
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        .resume()
    }
    
}
