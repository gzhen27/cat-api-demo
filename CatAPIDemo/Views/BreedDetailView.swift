//
//  BreedDetailView.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import SwiftUI

struct BreedDetailView: View {
    let breed: Breed
    
    var imageUrl: URL? {
        URL(string: breed.image?.url ?? "")
    }
    
    var body: some View {
        GeometryReader { geo in
            let imageSize = CGSize(width: geo.size.width, height: geo.size.width*0.67)
            ScrollView {
                VStack {
                    CustomImage(size: imageSize, url: imageUrl, cornerRadius: 10, imageRatio: .scaleToFit)
                    VStack(alignment: .leading, spacing: 15) {
                        Text(breed.name)
                            .font(.headline)
                        Text(breed.temperament)
                            .font(.footnote)
                        Text(breed.explaination)
                        
                        HStack {
                            Text("Energy Level")
                            Spacer()
                            ForEach(1..<6) { num in
                                Image(systemName: "heart.fill")
                                    .foregroundColor(
                                        breed.energyLevel >= num ? .pink : .gray
                                    )
                            }
                        }
                    }
                    .padding()
                    .navigationBarTitleDisplayMode(.inline)
                    Spacer()
                }
            }
        }
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.getBreed())
    }
}
