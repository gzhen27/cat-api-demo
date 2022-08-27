//
//  BreedView.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/26/22.
//

import SwiftUI

struct BreedView: View {
    let breeds: [Breed]
    
    @State private var searchText: String = ""
    
    var filteredBreeds: [Breed] {
        if searchText == "" {
            return breeds
        } else {
            return breeds.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBreeds) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    } label: {
                        CatBreedCell(breed: breed)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find Your Perfect Cat")
        }
        .navigationViewStyle(.stack)
        .searchable(text: $searchText)
    }
}

struct BreedView_Previews: PreviewProvider {
    static var previews: some View {
        BreedView(breeds: CatBreed.successState().breeds)
    }
}
