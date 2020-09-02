//
//  PopularMovieListViewModel.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import Foundation
import Combine

class PopularMovieListViewModel: ObservableObject {
    @Published var movies = [PopularMovieViewModel]()
    
    func fetchPopularMovies() {
        NetworkManager().getPopularMovies { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let popularMovies):
                    self.movies = popularMovies.map(PopularMovieViewModel.init)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
