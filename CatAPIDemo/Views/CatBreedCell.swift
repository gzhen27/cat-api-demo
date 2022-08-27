//
//  CatBreedCell.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import SwiftUI

struct CatBreedCell: View {
    let breed: Breed
    
    let imageSize = CGSize(width: 100, height: 100)
    var imageUrl: URL? {
        URL(string: breed.image?.url ?? "")
    }
    
    var body: some View {
        HStack {
            CustomImage(size: imageSize, url: imageUrl, cornerRadius: 10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
    }
}

struct CatBreedCell_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedCell(breed: Breed.getBreed())
            .previewLayout(.fixed(width: 500.0, height: 150))
    }
}
