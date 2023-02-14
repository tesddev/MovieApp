//
//  ContentView.swift
//  MovieApp
//
//  Created by Tes on 14/02/2023.
//

import SwiftUI

struct MovieView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
