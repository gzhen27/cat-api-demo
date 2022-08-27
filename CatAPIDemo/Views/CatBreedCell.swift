//
//  CatBreedCell.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import SwiftUI

struct CatBreedCell: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            if let imageUrl = URL(string: "\(breed.image?.url ?? "")") {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        Color.red
                            .frame(width: imageSize, height: imageSize)
                            .cornerRadius(10)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                Color.gray
                    .frame(width: imageSize, height: imageSize)
                    .cornerRadius(10)
            }
            
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
