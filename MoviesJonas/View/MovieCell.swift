//
//  MovieListViewCellController.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 22.11.22.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    
    struct Layout {
        static let cellInset: CGFloat = 10
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()

    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let horizontalStackView = UIStackView()
        horizontalStackView.spacing = 3

        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subTitleLabel)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(ratingLabel)
        contentView.addSubview(horizontalStackView)
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Layout.cellInset).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Layout.cellInset).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Layout.cellInset).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Layout.cellInset).isActive = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subTitleLabel.text = nil
        ratingLabel.text = nil
    }

    func configure(_ movie: MovieViewModel) {
        titleLabel.text = movie.title
        subTitleLabel.text = movie.release_date
        ratingLabel.text = movie.rt_score
    }
}
