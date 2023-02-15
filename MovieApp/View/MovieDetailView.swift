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
        List(cast) { cast in
            VStack(alignment: .leading){
                Text(cast.character)
                Text(cast.name)
                    .font(.caption)
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .mock, cast: .mock)
    }
}
