//
//  MovieCharacterApp.swift
//  MovieCharacter
//
//  Created by Park Kangwook on 2022/05/12.
//

import SwiftUI

@main
struct MovieCharacterApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView(movie: Movie())
            }
        }
    }
}
