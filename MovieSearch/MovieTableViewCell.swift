//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: MovieTableViewCellDelegate?
    var favoriteMovie: FavoritedMovie? {
        didSet {
            updateButtonView()
        }
    }
    var movie: Movie?{
        didSet {
            updateViews()
        }
    }
    @IBAction func isFavoriteButtonTapped(_ sender: Any) {
        delegate?.isFavorteMovieButtonTapped(self)
    }
    
    // MARK: - Update Function
    
    func updateViews() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.rating)"
        overviewLabel.text = movie.overview
        ImageController.getImage(atURL: movie.posterURLString) { (image) in
            DispatchQueue.main.async {
                self.posterImageView.image = image
            }
        }
        guard let favoriteMovie = favoriteMovie else { return }
        let images = favoriteMovie.isFavorite ? #imageLiteral(resourceName: "FilledStar") : #imageLiteral(resourceName: "EmptyStar")
        favoriteButton.setImage(images, for: .normal)
       
    }
    
    func updateButtonView() {
        guard let favoriteMovie = favoriteMovie else { return }
        let images = favoriteMovie.isFavorite ? #imageLiteral(resourceName: "FilledStar") : #imageLiteral(resourceName: "EmptyStar")
        favoriteButton.setImage(images, for: .normal)
        
    }
}

protocol MovieTableViewCellDelegate {
    func isFavorteMovieButtonTapped(_ sender: MovieTableViewCell)
}
