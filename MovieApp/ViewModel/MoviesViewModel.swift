//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Tes on 14/02/2023.
//

import Foundation

@MainActor
class MoviesViewModel: ObservableObject {
    enum States {
        case loading
        case loaded(movies: [Movie])
        case error(Error)
    }
    @Published var state: States = .loading
    let service = MoviesService()
    
    func loadMovies() async {
        do {
            let movies =  try await service.getMoviesFromAPI()
            state = .loaded(movies: movies)
        } catch {
            state = .error(error)
        }
    }
}
