//
//  CustomImage.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import SwiftUI

struct CustomImage: View {
    let size: CGSize
    let url: URL?
    let cornerRadius: CGFloat
    
    init(size: CGSize, url: URL?, cornerRadius: CGFloat = 0.0) {
        self.size = size
        self.url = url
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        if let imageUrl = url {
            AsyncImage(url: imageUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .cornerRadius(cornerRadius)
                } else if phase.error != nil {
                    Color.red
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(cornerRadius)
                } else {
                    ProgressView()
                        .frame(width: size.width, height: size.height)
                }
            }
        } else {
            Color.gray
                .frame(width: size.width, height: size.height)
                .cornerRadius(cornerRadius)
        }
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        let size = CGSize(width: 100, height: 100)
//        let url = URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
        Group {
            CustomImage(size: size, url: nil, cornerRadius: 10)
                .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
//            CustomImage(size: size, url: url)
//                .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
        }
    }
}
