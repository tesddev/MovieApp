//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Tes on 14/02/2023.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MoviesView()
            }
        }
    }
}
