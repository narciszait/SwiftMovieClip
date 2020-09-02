//
//  Movie.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import Foundation

//this is the model for the json coming from the server

// MARK: - MovieElement
struct Movie: Codable {
    let title, releasedate, studio: String?
    let poster, poster2X: String?
    let moviesite: String?
    let location: String?
    let rating: Rating?
    let genre: [Genre]?
    let directors: String?
    let actors: [String]?
    let trailers: [Trailer]?

    enum CodingKeys: String, CodingKey {
        case title, releasedate, studio, poster
        case poster2X = "poster_2x"
        case moviesite, location, rating, genre, directors, actors, trailers
    }
}

enum Genre: String, Codable {
    case actionAndAdventure = "Action and Adventure"
    case comedy = "Comedy"
    case documentary = "Documentary"
    case drama = "Drama"
    case family = "Family"
    case fantasy = "Fantasy"
    case foreign = "Foreign"
    case horror = "Horror"
    case romance = "Romance"
    case scienceFiction = "Science Fiction"
    case thriller = "Thriller"
    case musical = "Musical"
}

enum Rating: String, Codable {
    case notYetRated = "Not yet rated"
    case nr = "NR"
    case pg = "PG"
    case pg13 = "PG-13"
    case r = "R"
}

// MARK: - Trailer
struct Trailer: Codable {
    let postdate, url, type: String?
    let exclusive, hd: Bool?
}
