//
//  NetworkManager.swift
//  Movie Clip
//
//  Created by Narcis Zait on 02/09/2020.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case unknownError
    case decodingError
}

class NetworkManager {
    let baseURL = "http://trailers.apple.com/"
    let newestMoviesURL = "https://trailers.apple.com/trailers/home/feeds/just_added.json"
    let popularMoviesURL = "https://trailers.apple.com/trailers/home/feeds/popular/most_pop.json"
    let movieInfo = "/trailer/feeds/data/" //add .json at the end
    
    func getNewestMoviews(completion: @escaping (Result<[NewestMovie], NetworkError>) -> Void) {
        guard let url = URL(string: newestMoviesURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.unknownError))
                return
            }
                
            print(String(data: data, encoding: .utf8)!)
            
            let movies = try? JSONDecoder().decode([NewestMovie].self, from: data)
            movies == nil ? completion(.failure(.decodingError)) : completion(.success(movies!))
        }.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[PopularMovieThumbnail], NetworkError>) -> Void) {
        guard let url = URL(string: popularMoviesURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.unknownError))
                return
            }
                
            print(String(data: data, encoding: .utf8)!)
            
            let popularMovies = try? JSONDecoder().decode(PopularMovie.self, from: data)
            var movies = [PopularMovieThumbnail]();
            if let popularMovies = popularMovies {
                for popular in popularMovies.items {
                    movies.append(contentsOf: popular.thumbnails)
                }
            }
            popularMovies == nil ? completion(.failure(.decodingError)) : completion(.success(movies))
        }.resume()
    }
    
//    func getThisWeekMovie(movieId: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
//        guard let url = URL(string: "\(baseURL)\(movieInfo).json") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.httpMethod = "GET"
//        
//        URLSession.shared.dataTask(with: request) {data, response, error in
//            guard let data = data, error == nil else {
//                completion(.failure(.unknownError))
//                return
//            }
//                
//            print(String(data: data, encoding: .utf8)!)
//            
//            let movies = try? JSONDecoder().decode([Movie].self, from: data)
//            movies == nil ? completion(.failure(.decodingError)) : completion(.success(movies!))
//        }.resume()
//    }
    
//    func getMovieTrailer(trailerString: String) {
//        let movieTrailerURL = baseURL + trailerString
//        guard let url = URL(string: movieTrailerURL) else {
//            return
//        }
//
//
//    }
}
