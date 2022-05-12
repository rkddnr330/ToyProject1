//
//  ContentView.swift
//  MovieCharacter
//
//  Created by Park Kangwook on 2022/05/12.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ProductRowView()
            ProductRowView()
            ProductRowView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
