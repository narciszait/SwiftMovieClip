//
//  MovieViewModel.swift
//  Wrist Movies WatchKit Extension
//
//  Created by Narcis Zait on 05/03/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import Foundation

//this is used in the app to show the list of new trailers/movies
//this could be in the same file as MovieListViewModel
struct NewestMovieViewModel {
    let movie: NewestMovie
    
    init(movie: NewestMovie) {
        self.movie = movie
    }
    
    var title: String {
        return self.movie.title ?? "No title"
    }
    
    var poster: String {
        return self.movie.poster2X ?? self.movie.poster ?? "No url"
    }
    
    var releaseDate: String {
        return self.movie.releasedate ?? "No release date"
    }
    
    var trailerURL: String {
        return self.movie.trailers?.first?.url ?? "No trailer URL"
    }
}
