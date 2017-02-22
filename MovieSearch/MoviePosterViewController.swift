//
//  MoviePosterViewController.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class MoviePosterViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    var favMovie: FavoritedMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func tapGestureTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateViews() {
        guard let movie = movie else {
            guard let favMovie = favMovie  else { return }
            posterImageView.image = UIImage(data: favMovie.posterImage as! Data)
            return }
        
        DispatchQueue.main.async {
        ImageController.getImage(atURL: movie.posterURLString) { (image) in
            self.posterImageView.image = image
            }
        }
    }

    
}
