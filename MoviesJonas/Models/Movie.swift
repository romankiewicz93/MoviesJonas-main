//
//  Movie.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 21.11.22.
//

import Foundation
class Movie: Codable {
    var id: String
    var releaseDate: String
    var title: String
    var rtScore: String
    var director: String
    var description: String
    var isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case releaseDate = "release_date"
        case title
        case rtScore = "rt_score"
        case director
        case description
        case isFavorite
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        title = try container.decode(String.self, forKey: .title)
        rtScore = try container.decode(String.self, forKey: .rtScore)
        director = try container.decode(String.self, forKey: .director)
        description = try container.decode(String.self, forKey: .description)
        if let isFavorite = try? container.decode(Bool.self, forKey: .isFavorite) {
            self.isFavorite = isFavorite
        } else {
            isFavorite = false
        }
    }

    func update(with newMovie: Movie) {
        id = newMovie.id
        releaseDate = newMovie.releaseDate
        title = newMovie.title
        rtScore = newMovie.rtScore
        director = newMovie.director
        description = newMovie.description
    }
}
