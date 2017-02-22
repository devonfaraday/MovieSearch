//
//  MovieDetailViewController.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addToFavoritesButton: UIButton!
    
    var movie: Movie?
    var favMovie: FavoritedMovie?
    var dataImage: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func swipeDownToExitSwipped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateViews() {
        guard let movie = movie else {
            guard let favMovie = favMovie else { return }
            addToFavoritesButton.setTitle("Back to Favorites", for: .normal)
            titleLabel.text = favMovie.title
            ratingLabel.text = "Rating: \(favMovie.rating)"
            overviewLabel.text = favMovie.overview
            posterImageView.image = UIImage(data: favMovie.posterImage as! Data)
            return }
        addToFavoritesButton.setTitle("Add to Favorites", for: .normal)
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.rating)"
        overviewLabel.text = movie.overview
        ImageController.getImage(atURL: movie.posterURLString) { (image) in
            self.posterImageView.image = image
            
        }
        
    }
    
    @IBAction func backToFavButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addToFavButtonTapped(_ sender: Any) {
        guard let movie = movie else {
            guard favMovie != nil else { return }
            dismiss(animated: true, completion: nil)
            return }
        DispatchQueue.main.async {
            ImageController.getImage(atURL: movie.posterURLString) { (image) in
                guard let image = image else { return }
                self.dataImage = UIImagePNGRepresentation(image)
            }
        }
        addToFavoritesButton.setTitle("Swipe Down To Exit", for: .normal)
        guard let dataImage = dataImage else { return }
        FavoritedMovieController.shared.addFavoriteWith(title: movie.title, overview: movie.overview, rating: movie.rating, posterImage: dataImage)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Keys.toShowPosterKey {
        guard let posterVC = segue.destination as? MoviePosterViewController else { return }
        guard  let movie = movie else {
            guard let favMovie = favMovie else { return }
            posterVC.favMovie = favMovie
            return }
        posterVC.movie = movie
        }
    }

}
