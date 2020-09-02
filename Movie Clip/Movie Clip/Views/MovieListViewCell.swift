//
//  DetailView.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct NewestMovieListViewCell: View {
    var movie: NewestMovieViewModel
    
    var body: some View {
        //        HStack(alignment: .center) {
//                    if (movie.poster == "No url") {
//                        Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                    } else {
//                        KFImage(URL(string: movie.poster)!)
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .frame(width: 80, height: 80)
//                    }
        //
        //            Spacer()
        //
        //            VStack {
        //                Text(movie.title)
        //                    .minimumScaleFactor(0.5)
        //                    .font(.title)
        //                    .lineLimit(1)
        //            }
        //
        //            Spacer()
        VStack(alignment: .center){
            Spacer()
            
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
            
            Spacer()
        }
        .padding()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewestMovieListViewCell(movie: NewestMovieViewModel(movie: NewestMovie(title: "Black Widow", releasedate: nil, studio: "c", poster: nil, poster2X: nil, moviesite: "", location: "", rating: nil, genre: nil, directors: nil, actors: nil, trailers: nil)))
    }
}
