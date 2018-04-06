//
//  Movie.swift
//  estagiaria
//
//  Created by Gian Nucci on 01/03/18.
//  Copyright © 2018 Gian Nucci. All rights reserved.
//

import Foundation

struct FileMovie: Codable {
    var totalResults:Int
    var totalPages:Int
    var page:Int
    var results:[Movie]
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case page
        case results
    }
}

struct Movie: Codable {
    var idMovie: Int?
    var titleMovie: String?
    var posterPath: String?
    var adult: Bool?
    var releaseDate: String?
    var overview: String?
    
    enum CodingKeys: String, CodingKey {
        case idMovie = "id"
        case titleMovie = "title"
        case posterPath = "poster_path"
        case adult = "adult"
        case releaseDate = "release_date"
        case overview = "overview"
    }
}
