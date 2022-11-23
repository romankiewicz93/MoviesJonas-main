//
//  MovieListViewController.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 21.11.22.
//

import Foundation
import UIKit

class MovieListViewController: UITableViewController {
    private let viewModel = MoviesListViewModel()

    private let movieCellIdentifier = "MovieCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        subscribeToViewModel()
        populateMovies()
    }

    // MARK: - Private

    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Movies"
        tableView.register(MovieCell.self, forCellReuseIdentifier: movieCellIdentifier)
        tableView.separatorStyle = .none
    }

    private func subscribeToViewModel() {
        viewModel.movies.bind { _ in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    private func populateMovies() {
        viewModel.showMovies(url: Constants.Urls.allMovies)
    }
}

// MARK: - UITableViewDataSource

extension MovieListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: movieCellIdentifier, for: indexPath) as? MovieCell else {
            fatalError("MovieCell is not defined")
        }
        let movie = viewModel.movies.value[indexPath.row]
        cell.configure(movie)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailViewController = MovieDetailViewController()
        let movie = viewModel.movies.value[indexPath.row]
        movieDetailViewController.viewModel = movie
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}
