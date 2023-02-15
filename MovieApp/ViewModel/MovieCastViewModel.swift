//
//  MovieCastViewModel.swift
//  MovieApp
//
//  Created by Tes on 15/02/2023.
//

import Foundation

@MainActor
class MovieCastViewModel: ObservableObject {
    let service = CastService()
    
    func loadMovieCastsOf(movie: Movie) async throws -> [MovieCastMember] {
        let movieCasts = try await service.getCast(of: movie)
        return movieCasts
    }
}
