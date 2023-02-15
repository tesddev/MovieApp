//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by GIGL iOS on 15/02/2023.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State var cast: [MovieCastMember] = []
    var body: some View {

        List {
            Section {
                HStack {
                    AsyncImage(url: movie.posterURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 220)
                    
                    Text(movie.overview)
                }
            }
            ForEach(cast) { cast in
                VStack(alignment: .leading){
                    Text(cast.character)
                    Text(cast.name)
                        .font(.caption)
                }
            }
        }
        .navigationTitle(movie.title)
        .task {
            do {
                let service = CastService()
                cast = try await service.getCast(of: movie)
            } catch {}
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .mock, cast: .mock)
    }
}
