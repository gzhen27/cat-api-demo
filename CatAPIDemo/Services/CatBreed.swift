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
    let params = "?limit=9"
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    // MARK: - Property Wrappers
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Computing Variables
    var url: URL? {
        URL(string: "\(baseUrl)\(path)\(params)")
    }
    
    // MARK: - LifeCycle
    init() {
        fetchAll()
    }
    
    
    // MARK: - Functions
    func fetchAll() {
        guard let url = url else {
            print("Not a valid URL")
            return
        }
        
        isLoading = true
        
        session.dataTask(with: url) { [unowned self] data, res, err in
            
            // returns when there is any error
            if let err = err {
                print("Not able to loads the breeds: \(err.localizedDescription)")
                return
            }
            
            // returns when the response status code is not 200
            guard let res = res as? HTTPURLResponse, res.statusCode == 200 else {
                print("Wrong status code")
                return
            }
            
            // returns if data is missing
            guard let breedData = data else {
                print("No data returned")
                return
            }
            
            do {
                let breeds = try decoder.decode([Breed].self, from: breedData)
                
                DispatchQueue.main.async {
                    self.breeds = breeds
                    self.isLoading = false
                }
            } catch {
                print("Failed to decode the data: \(error)")
            }
        }
        .resume()
    }
    
}
