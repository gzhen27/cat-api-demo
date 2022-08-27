//
//  Breed.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/26/22.
//

import Foundation

struct Breed: Codable {
    let id: String
    let name: String
    let temperament: String
    let lifeSpan: String
    let isHairless: Bool
    let image: BreedImage
    
    // need to call init to assgin the value properly because hairless is an Int from the CatAPI, but we want it to be Bool.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        lifeSpan = try values.decode(String.self, forKey: .lifeSpan)
        image = try values.decode(BreedImage.self, forKey: .image)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, temperament, image
        case lifeSpan = "life_span"
        case isHairless = "hairless"
    }

}

extension Breed: CustomStringConvertible {
    
    var description: String {
        return """
        \n
        >--------------Cat Info----------------<
        \n
        id: \(id)
        name: \(name)
        termperament: \(temperament)
        life span: \(lifeSpan)
        is hairlesss: \(isHairless)
        imageURL: \(image.url)
        \n
        >--------------------------------------<
        """
    }
    
}
