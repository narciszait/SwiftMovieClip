//
//  PopularMovieListVIew.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import SwiftUI
import Combine
import KingfisherSwiftUI

struct PopularMovieListVIew: View {
    @ObservedObject var popularMovieListVM = PopularMovieListViewModel()
    
    init() {
        self.popularMovieListVM.fetchPopularMovies()
    }
    
    var body: some View {
        NavigationView {
            List(popularMovieListVM.movies, id:\.title) { movie in
                NavigationLink(
                    destination: PopularMovieDetailView(movie: movie),
                    label: {
                        Text(movie.title)
                            .font(.headline)
                    })
            }
            .navigationBarTitle("Most Popular Movies", displayMode: .automatic)
        }
    }
}

struct PopularMovieListVIew_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieListVIew()
    }
}
