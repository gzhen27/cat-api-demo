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
        VStack {
            if catBreed.isLoading {
                LoadingView()
            } else if catBreed.errorMessage != nil {
                ErrorView(catBreed: catBreed)
            } else {
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
