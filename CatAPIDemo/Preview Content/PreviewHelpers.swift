//
//  PreviewHelpers.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import Foundation

extension Breed {
    /**
     gets the test data - an example of Breed
     */
    static func getBreed() -> Breed {
        return Breed(id: "01", name: "test01", temperament: "test01 temperament", lifeSpan: "test01 life span", isHairless: false, image: nil)
    }
    
    /**
     gets the test data - an array of breeds
     */
    static func getBreeds() -> [Breed] {
        var breeds: [Breed] = []
        
        let isHairless = Int.random(in: 0...1) != 0
        
        (1...9).forEach { n in
            let breed = Breed(id: "0\(n)", name: "test0\(n)", temperament: "test0\(n) temperament", lifeSpan: "test0\(n) life span", isHairless: isHairless, image: nil)
            breeds.append(breed)
        }
        
        (10...30).forEach{ n in
            let breed = Breed(id: "\(n)", name: "test\(n)", temperament: "test\(n) temperament", lifeSpan: "test\(n) life span", isHairless: isHairless, image: nil)
            breeds.append(breed)
        }
        
        return breeds
    }
}

extension CatBreed {
    // MARK: - preview helpers
    static func errorState() -> CatBreed {
        let catBreed = CatBreed()
        catBreed.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return catBreed
    }
    
    static func successState() -> CatBreed {
        let catBreed = CatBreed()
        catBreed.breeds = Breed.getBreeds()
        return catBreed
    }
}
