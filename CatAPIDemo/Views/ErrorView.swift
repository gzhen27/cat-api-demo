//
//  ErrorView.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/27/22.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var catBreed: CatBreed
    
    var body: some View {
        VStack {
            Text(catBreed.errorMessage ?? "Errors")
                .foregroundColor(.red)
                .bold()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(catBreed: CatBreed.errorState())
    }
}
