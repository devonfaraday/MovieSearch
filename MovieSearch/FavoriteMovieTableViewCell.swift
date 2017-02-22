//
//  FavoriteMovieTableViewCell.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class FavoriteMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var favMovie: FavoritedMovie? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let favMovie = favMovie,
            let posterImage = favMovie.posterImage as? Data else { return }
        posterImageView.image = UIImage(data: posterImage)
        titleLabel.text = favMovie.title
    }

}
