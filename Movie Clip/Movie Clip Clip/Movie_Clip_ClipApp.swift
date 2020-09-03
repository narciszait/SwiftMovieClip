//
//  Movie_Clip_ClipApp.swift
//  Movie Clip Clip
//
//  Created by Narcis Zait on 03/09/2020.
//

import SwiftUI

@main
struct Movie_Clip_ClipApp: App {
    @State var tabToOpen = 1
    
    var body: some Scene {
        WindowGroup {
            if (tabToOpen == 1) {
                PopularMovieListVIew()
                    .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: respondTo)
            } else if (tabToOpen == 0) {
                NewestMovieListView()
                    .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: respondTo)
            }
        }
    }
    
    func respondTo(_ activity: NSUserActivity?) {
        guard let tabToOpen = firstParameterValue(from: activity) else { return }
        
        self.tabToOpen = tabToOpen
    }
    
    private func firstParameterValue(from activity: NSUserActivity?) -> Int? {
        // Parsing components from URL
        guard let activity = activity else { return nil }
        guard let incomingURL = activity.webpageURL else { return nil }
        guard let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) else { return nil }
        
        // Taking first parameter: example.com/?parameter=Lisa
        return Int(components.queryItems?.first?.value ?? "1")
    }
}

struct Movie_Clip_ClipApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: .constant("Narcis"))
    }
}
