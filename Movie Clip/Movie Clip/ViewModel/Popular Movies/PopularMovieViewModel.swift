//
//  PopularMovieViewModel.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import Foundation

struct PopularMovieViewModel {
    let popularMovie: PopularMovieThumbnail
    
    init(popularMovie: PopularMovieThumbnail) {
        self.popularMovie = popularMovie
    }
    
    var title: String {
        return self.popularMovie.title ?? "No title"
    }
    
    var id: String {
        return self.popularMovie.id ?? "2"
    }
    
    var poster: String {
        return self.popularMovie.poster2X ?? self.popularMovie.poster ?? "No url"
    }
}
