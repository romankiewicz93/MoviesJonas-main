//
//  MovieDetailViewController.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 23.11.22.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    var viewModel: MovieViewModel? = nil
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    
    // MARK: - Private
    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.tintColor = .black
        view.backgroundColor = .white
        title = viewModel?.title
        let detailView = DetailView(frame: .zero)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.configureUI(model: viewModel!)
        self.view.addSubview(detailView)
        detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}
