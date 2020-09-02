//
//  ThisWeekMovies.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import Foundation

// MARK: - ThisWeekMovie
struct Movie: Codable {
    let commentHeader: [String]
    let divider: String
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case commentHeader = "_commentHeader"
        case divider, items
    }
}

// MARK: - Item
struct Item: Codable {
    let category: String
    let thumbnails: [Thumbnail]
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let title, id: String
    let hd, exclusive: Bool
    let url, showtimesurl: String
    let poster, largePoster, xlargePoster: String
    let poster2X, largePoster2X, xlargePoster2X, itunesurl: String
    let genre1, genre2, genre3: String

    enum CodingKeys: String, CodingKey {
        case title, id, hd, exclusive, url, showtimesurl, poster
        case largePoster = "large_poster"
        case xlargePoster = "xlarge_poster"
        case poster2X = "poster_2x"
        case largePoster2X = "large_poster_2x"
        case xlargePoster2X = "xlarge_poster_2x"
        case itunesurl, genre1, genre2, genre3
    }
}

