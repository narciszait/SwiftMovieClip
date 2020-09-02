//
//  DetailView.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct NewestMovieDetailView: View {
    var movie: NewestMovieViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center){
                if (movie.poster == "No url") {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                } else {
                    KFImage(URL(string: movie.poster)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                }
                
                Spacer()
                
                Text(movie.title)
                    .font(.title)
                    .lineLimit(1)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                ForEach(movie.actors, id: \.self) { actor in
                    Text(actor)
                        .font(.subheadline)
                }
            }
        }
    }
}


struct NewestMovieListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        NewestMovieDetailView(movie: NewestMovieViewModel(movie: NewestMovie(title: "Black Widow", releasedate: nil, studio: "c", poster: nil, poster2X: nil, moviesite: "", location: "", rating: nil, genre: nil, directors: nil, actors: nil, trailers: nil)))
    }
}
