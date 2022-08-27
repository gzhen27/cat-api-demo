//
//  CatMainView.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/26/22.
//

import SwiftUI

struct CatMainView: View {
    @StateObject private var catBreed = CatBreed()
    
    var body: some View {
        // TO-DO: redesing the View here
        ZStack {
            if catBreed.isLoading {
                LoadingView()
            }
            
            if catBreed.breeds.count > 0 {
                BreedView(breeds: catBreed.breeds)
            }
        }
    }
}

struct CatMainView_Previews: PreviewProvider {
    static var previews: some View {
        CatMainView()
    }
}
