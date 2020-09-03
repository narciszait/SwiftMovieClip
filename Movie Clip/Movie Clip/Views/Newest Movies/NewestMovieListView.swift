//
//  MovieListView.swift
//  Wrist Movies WatchKit Extension
//
//  Created by Narcis Zait on 09/03/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import SwiftUI
import Combine
import KingfisherSwiftUI

struct NewestMovieListView: View {
    @ObservedObject var newestMovieListVM = NewestMovieListViewModel()
    
    init() {
        self.newestMovieListVM.fetchAllNewMovies()
    }
    
    var body: some View {
        NavigationView {
            List(newestMovieListVM.movies, id:\.title) { movie in
                NavigationLink(
                    destination: NewestMovieDetailView(movie: movie),
                    label: {
                        Text(movie.title)
                            .font(.headline)
                    })
            }
            .navigationBarTitle("New Movies", displayMode: .automatic)
        }
    }
}

struct NewestMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        NewestMovieListView()
    }
}
