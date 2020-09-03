//
//  ContentView.swift
//  Movie Clip Clip
//
//  Created by Narcis Zait on 03/09/2020.
//

import SwiftUI

struct ContentView: View {
    @Binding var name: String

        var body: some View {
            Text("Hello, \(name)").padding()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: .constant("Narcis"))
    }
}
