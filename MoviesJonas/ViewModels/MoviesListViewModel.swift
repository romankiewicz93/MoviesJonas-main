//
//  MoviesListViewModel.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 21.11.22.
//

import Foundation

class MoviesListViewModel {
    private(set) var movies: Dynamic<[MovieViewModel]> = Dynamic([])

    func showMovies(url: URL) {
        Task {
            do {
                let movies = try await WebService()
                    .getMovies(url: url)
                let updatedMovies = MovieStoreManager.uptadeAllMovies(movies)
                let movieViewModels = updatedMovies.map(MovieViewModel.init)
                self.movies.value = movieViewModels
            } catch {
                print(error)
            }
        }
    }
}

class MovieViewModel {
    let id: String
    let release_date: String
    let title: String
    let rt_score: String
    let director: String
    let description: String
    let movie: Movie

    init(movie: Movie) {
        self.movie = movie
        id = movie.id
        release_date = movie.releaseDate
        title = movie.title
        rt_score = movie.rtScore
        director = movie.director
        description = movie.description
    }
}
