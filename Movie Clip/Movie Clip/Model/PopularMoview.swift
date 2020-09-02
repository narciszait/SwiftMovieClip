//
//  PopularMoview.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import Foundation

// MARK: - PopularMovie
struct PopularMovie: Codable {
    let commentHeader: [String]
    let divider: String
    let items: [PopularMovieItem]

    enum CodingKeys: String, CodingKey {
        case commentHeader = "_commentHeader"
        case divider, items
    }
}

// MARK: - Item
struct PopularMovieItem: Codable {
    let category: String
    let thumbnails: [PopularMovieThumbnail]
}

// MARK: - Thumbnail
struct PopularMovieThumbnail: Codable {
    let title, id: String
    let url: String
    let poster, largePoster, xlargePoster, poster2X: String
    let largePoster2X, xlargePoster2X: String
    let exclusive, hd: Bool
    let itunesurl, showtimesurl: String
    let genre1: Genre1
    let genre2: String
    let genre3: Genre3
    let rtRating: String?

    enum CodingKeys: String, CodingKey {
        case title, id, url, poster
        case largePoster = "large_poster"
        case xlargePoster = "xlarge_poster"
        case poster2X = "poster_2x"
        case largePoster2X = "large_poster_2x"
        case xlargePoster2X = "xlarge_poster_2x"
        case exclusive, hd, itunesurl, showtimesurl, genre1, genre2, genre3
        case rtRating = "rt_rating"
    }
}

enum Genre1: String, Codable {
    case actionAndAdventure = "Action and Adventure"
    case comedy = "Comedy"
    case documentary = "Documentary"
    case drama = "Drama"
    case empty = ""
    case fantasy = "Fantasy"
    case horror = "Horror"
    case thriller = "Thriller"
}

enum Genre3: String, Codable {
    case empty = ""
    case fantasy = "Fantasy"
    case foreign = "Foreign"
    case scienceFiction = "Science Fiction"
    case thriller = "Thriller"
}
