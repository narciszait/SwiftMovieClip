//
//  ThisWeekMovies.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import Foundation

// MARK: - ThisWeekMovie
struct Movie: Codable {
    let page: Page
    let details: Details
}

// MARK: - Details
struct Details: Codable {
    let locale: Locale
}

// MARK: - Locale
struct Locale: Codable {
    let en: En
}

// MARK: - En
struct En: Codable {
    let synopsis: String
}

// MARK: - Page
struct Page: Codable {
    let movieTitle, trailerURL, releaseCopy: String

    enum CodingKeys: String, CodingKey {
        case movieTitle = "movie_title"
        case trailerURL = "trailer_url"
        case releaseCopy = "release_copy"
    }
}
