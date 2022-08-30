//
//  CustomImage.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import SwiftUI


// temporary fix for the ratio
enum ImageRatio {
    case scaleToFit
    case scaleToFill
}

struct CustomImage: View {
    let size: CGSize
    let url: URL?
    let cornerRadius: CGFloat
    let imageRatio: ImageRatio
    
    init(size: CGSize, url: URL?, cornerRadius: CGFloat = 0.0, imageRatio: ImageRatio = .scaleToFill) {
        self.size = size
        self.url = url
        self.cornerRadius = cornerRadius
        self.imageRatio = imageRatio
    }
    
    var body: some View {
        if url != nil {
            AsyncImage(url: url) { image in
                if imageRatio == .scaleToFill {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .cornerRadius(cornerRadius)
                } else {
                    image
                        .resizable()
                        .cornerRadius(cornerRadius)
                        .scaledToFit()
                        .frame(width: size.width, height: size.height)
                        .clipped()
                }
            } placeholder: {
                ProgressView()
                    .frame(width: size.width, height: size.height)
            }
        } else {
            ZStack {
                Color.gray
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(cornerRadius)
                Text("No Image")
                    .bold()
            }
        }
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        let size = CGSize(width: 100, height: 100)
        Group {
            CustomImage(size: size, url: nil, cornerRadius: 10)
                .previewLayout(.fixed(width: size.width, height: size.height))
        }
    }
}
