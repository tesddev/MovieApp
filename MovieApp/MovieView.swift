//
//  ContentView.swift
//  MovieApp
//
//  Created by Tes on 14/02/2023.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                
            }
            .frame(width: 80)
            
            VStack(alignment: .leading){
                Text(movie.title)
                    .font(.headline)
                Text(movie.overview)
                    .lineLimit(4)
            }
        }
        .padding()
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie.mock
        MovieView(movie: movie)
    }
}
