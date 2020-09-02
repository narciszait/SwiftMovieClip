//
//  DetailView.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct DetailView: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            KFImage(URL(string: movie.poster ?? "")!)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(width: 80, height: 80)
            
            Spacer()
            
            VStack {
                Text(movie.title ?? "")
                    .minimumScaleFactor(0.5)
            }
            
            Spacer()
        }.frame(height: 100)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(title: "a", releasedate: "b", studio: "c", poster: "d", poster2X: nil, moviesite: "", location: "", rating: nil, genre: nil, directors: nil, actors: nil, trailers: nil))
    }
}
