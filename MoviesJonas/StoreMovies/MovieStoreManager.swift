//
//  MovieStoreManager.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 28.11.22.
//

import Foundation

class MovieStoreManager {
    
    private static var favoriteMoviesKey: String {
        "com.movies.favorite"
    }
    
    static func markNewMovieAsFavorite(_ movie: Movie, isFavorite: Bool){
        var localMovies = fetchLocalMovies() ?? []
       
        if let foundMovie = localMovies.first { film in
            movie.id == film.id
        } {
            foundMovie.isFavorite = isFavorite
        } else {
            movie.isFavorite = isFavorite
            localMovies.append(movie)
        }
        saveAllMovies(localMovies)
    }
    
    static func uptadeAllMovies(_ movies: [Movie]) -> [Movie]{
        var localMovies = fetchLocalMovies() ?? []
        for movie in movies {
            if let foundMovie = localMovies.first { film in
                movie.id == film.id
            } {
                foundMovie.update(with: movie)
            } else {
               localMovies.append(movie)
            }
        }
        saveAllMovies(localMovies)
        return localMovies
    }
    
    static func saveAllMovies(_ movies: [Movie]){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(movies) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: favoriteMoviesKey)
            defaults.synchronize()
        }
    }
    
    static func fetchLocalMovies() -> [Movie]?{
        if let savedMovie = UserDefaults.standard.object(forKey: favoriteMoviesKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedMovies = try? decoder.decode([Movie].self, from: savedMovie) {
                print("\(loadedMovies)")
                return loadedMovies
            }
        }
        return nil
    }
}
