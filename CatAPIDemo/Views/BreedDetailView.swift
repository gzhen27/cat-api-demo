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
            VStack {
                CustomImage(size: imageSize, url: imageUrl)
            }
        }
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.getBreed())
    }
}
