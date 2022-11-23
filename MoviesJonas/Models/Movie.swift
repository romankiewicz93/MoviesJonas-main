//
//  Movie.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 21.11.22.
//

import Foundation

struct Movie: Decodable {
    let releaseDate: String
    let title: String
    let rtScore: String
    let director: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case title
        case rtScore = "rt_score"
        case director
        case description
    }
}
