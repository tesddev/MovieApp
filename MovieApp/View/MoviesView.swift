//
//  ContentView.swift
//  MovieApp
//
//  Created by Tes on 14/02/2023.
//

import SwiftUI

struct MoviesView: View {
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error(let error):
                Text(error.localizedDescription)
            case .loaded(let movies):
                listOf(movies: movies)
            }

        }
        .navigationTitle("Upcoming Movies")
        .task {
            await viewModel.loadMovies()
        }
    }
    
    @ViewBuilder
    func listOf(movies: [Movie]) -> some View {
        if !movies.isEmpty {
            List(movies) { movie in
                NavigationLink {
                    MovieDetailView(movie: movie)
                } label: {
                    HStack {
                        AsyncImage(url: movie.posterURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 80)
                        
                        VStack(alignment: .leading){
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.overview)
                                .lineLimit(4)
                        }
                    }
                }
                .padding()
            }
        } else {
            Text("No upcoming movies")
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoviesView()
        }
    }
}
