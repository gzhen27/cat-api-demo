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
    
    let apiService = APIService()
    
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
        isLoading = true
        errorMessage = nil
        
        apiService.fetchBreeds(url: url) { [unowned self] result in
            switch result {
            case .failure(let err):
                self.errorMessage = err.localizedDescription
            case .success(let breeds):
                DispatchQueue.main.async {
                    self.breeds = breeds
                }
                print(breeds)
            }
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    
}
