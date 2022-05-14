//
//  ContentView.swift
//  MovieCharacter
//
//  Created by Park Kangwook on 2022/05/12.
//

import SwiftUI

struct HomeView: View {
    let movie: Movie
    
    var body: some View {
        List(movie.products) { each in
            NavigationLink(destination: ProductDetailView(product: each)) {
                ProductRowView(product: each)
            }
        }
        .navigationTitle("지브리 영화")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(movie: Movie())
    }
}
