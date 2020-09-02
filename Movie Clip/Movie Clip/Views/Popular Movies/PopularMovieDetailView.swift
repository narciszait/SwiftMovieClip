//
//  PopularMovieDetailView.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import SwiftUI
import KingfisherSwiftUI
import AVKit

struct PopularMovieDetailView: View {
    var movie: PopularMovieViewModel
    @State var isLinkActive = false
    
    var body: some View {
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
                                Image(systemName: "play.circle").font(.title)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Text(movie.title)
                    .font(.title)
                    .lineLimit(1)
                
                Spacer()
            }.padding()
            .navigationBarTitle(movie.title, displayMode: .automatic)
    }
}


struct PopularMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieDetailView(movie: PopularMovieViewModel(popularMovie: PopularMovieThumbnail(title: "Black Widow", id: "2", url: nil, poster: "No url", largePoster: nil, xlargePoster: nil, poster2X: nil, largePoster2X: nil, xlargePoster2X: nil, exclusive: nil, hd: nil, itunesurl: nil, showtimesurl: nil, genre1: nil, genre2: nil, genre3: nil, rtRating: nil)))
    }
}
