//
//  DetailView.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 23.11.22.
//

import UIKit

class DetailView: UIView {
    
    var descriptionLabel: UILabel!
    var directorLabel: UILabel!
    var releaseDateLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(model: MovieViewModel){
        descriptionLabel.text = model.description
        directorLabel.text = model.director
        releaseDateLabel.text = model.release_date
    }
    
    struct Layout {
        static let labelInset: CGFloat = 10
    }
    
    private func setupUI() {
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.setContentHuggingPriority(.required, for: .vertical)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        directorLabel = UILabel()
        
        directorLabel.setContentHuggingPriority(.required, for: .vertical)
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        releaseDateLabel = UILabel()
        releaseDateLabel.setContentHuggingPriority(.required, for: .vertical)
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false

        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        verticalStackView.addArrangedSubview(directorLabel)
        verticalStackView.addArrangedSubview(releaseDateLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(spacer)
        addSubview(verticalStackView)
       
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.labelInset).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.labelInset).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.labelInset).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.labelInset).isActive = true
    }
}
