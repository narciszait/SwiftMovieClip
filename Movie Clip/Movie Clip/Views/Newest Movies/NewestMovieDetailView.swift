//
//  DetailView.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import SwiftUI
import KingfisherSwiftUI
import AVKit

struct NewestMovieDetailView: View {
    var movie: NewestMovieViewModel
    @State var isLinkActive = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center){
                if (movie.poster == "No url") {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                } else {
                    NavigationLink(destination: VideoPlayer(player: AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)), isActive: $isLinkActive) {
                        Button(action: {
                            self.isLinkActive = true
                        }) {
                            ZStack(alignment: .center) {
                                KFImage(URL(string: movie.poster)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                                Image(systemName: "play.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                    }.navigationBarTitle("", displayMode: .inline)
                }
                
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
        }.navigationBarTitle(movie.title, displayMode: .automatic)
    }
}


struct NewestMovieListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        NewestMovieDetailView(movie: NewestMovieViewModel(movie: NewestMovie(title: "Black Widow", releasedate: nil, studio: "c", poster: nil, poster2X: nil, moviesite: "", location: "", rating: nil, genre: nil, directors: nil, actors: nil, trailers: nil)))
    }
}
