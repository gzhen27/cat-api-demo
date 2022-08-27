//
//  BreedView.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/26/22.
//

import SwiftUI

struct BreedView: View {
    let breeds: [Breed]
    
    var body: some View {
        List {
            ForEach(breeds) { breed in
                CatBreedCell(breed: breed)
            }
        }
    }
}

struct BreedView_Previews: PreviewProvider {
    static var previews: some View {
        BreedView(breeds: CatBreed.successState().breeds)
    }
}
