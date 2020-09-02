//
//  MovieListViewModel.swift
//  Wrist Movies WatchKit Extension
//
//  Created by Narcis Zait on 05/03/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import Foundation
import Combine

class NewestMovieListViewModel: ObservableObject {
    @Published var movies = [NewestMovieViewModel]()
    
    func fetchAllNewMovies() {
        NetworkManager().getNewestMoviews { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.movies = movies.map(NewestMovieViewModel.init)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
