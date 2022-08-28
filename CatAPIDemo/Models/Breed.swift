//
//  Breed.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/26/22.
//

import Foundation

struct Breed: Codable, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let lifeSpan: String
    let explaination: String
    let energyLevel: Int
    let isHairless: Bool
    let image: BreedImage?
    
    // need to call init to assgin the value properly because hairless is an Int from the CatAPI, but we want it to be Bool.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        lifeSpan = try values.decode(String.self, forKey: .lifeSpan)
        explaination = try values.decode(String.self, forKey: .explaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
    }
    
    init(id: String, name: String, temperament: String, lifeSpan: String, explaination: String, energyLevel: Int, isHairless: Bool, image: BreedImage?) {
        self.id = id
        self.name = name
        self.temperament = temperament
        self.lifeSpan = lifeSpan
        self.explaination = explaination
        self.energyLevel = energyLevel
        self.isHairless = isHairless
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, temperament, image
        case lifeSpan = "life_span"
        case isHairless = "hairless"
        case explaination = "description"
        case energyLevel = "energy_level"
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
        imageURL: \(image?.url ?? "No Image")
        \n
        >--------------------------------------<
        """
    }
    
}
