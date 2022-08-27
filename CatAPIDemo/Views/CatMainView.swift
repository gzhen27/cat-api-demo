//
//  CatMainView.swift
//  CatAPIDemo
//
//  Created by G Zhen on 8/26/22.
//

import SwiftUI

struct CatMainView: View {
    @StateObject var catBreed = CatBreed()
    
    var body: some View {
        ZStack {
            if catBreed.isLoading {
                LoadingView()
            }
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatMainView()
    }
}
