//
//  ContentView.swift
//  MovieCharacter
//
//  Created by Park Kangwook on 2022/05/12.
//

import SwiftUI

struct HomeView: View {
    @State var product: Product
    
    var body: some View {
//        VStack {
//            ProductRowView()
//            ProductRowView()
//            ProductRowView()
//        }
        ForEach(Product.productList) { list in
            ProductRowView(product: list)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(product: Product.productList[0])
    }
}
