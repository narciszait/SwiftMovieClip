//
//  ContentView.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import SwiftUI

struct MainScreen: View {
    @State var selectedView: Int
    
    var body: some View {
        TabView(selection: $selectedView) {
            NewestMovieListView()
                .tabItem {
                    Image(systemName: "tv").font(.system(size: 16, weight: .regular))
                    Text("Newest Movies")
                }.tag(0)
            PopularMovieListVIew()
                .tabItem {
                    Image(systemName: "tv.circle.fill").font(.system(size: 16, weight: .regular))
                    Text("Most Popular Movies")
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(selectedView: 0)
    }
}
