//
//  CatView.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/26/22.
//

import SwiftUI

struct CatView: View {
    @StateObject var catBreed = CatBreed()
    
    var body: some View {
        VStack {
            BreedView(breeds: catBreed.breeds)
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
