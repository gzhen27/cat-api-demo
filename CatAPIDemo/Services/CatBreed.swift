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
    let apiService: APIServiceProtocol
    
    // MARK: - Property Wrappers
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Computing Variables
    var url: URL? {
        URL(string: "\(baseUrl)\(path)")
    }
    
    // MARK: - LifeCycle
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
        fetchAll()
    }
    
    
    // MARK: - Functions
    func fetchAll() {
        isLoading = true
        errorMessage = nil
        
        apiService.fetchBreeds(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let err):
                    self.errorMessage = err.localizedDescription
                case .success(let breeds):
                    self.breeds = breeds
                }
                self.isLoading = false
            }
        }
    }
    
}
