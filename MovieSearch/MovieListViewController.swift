//
//  MovieListViewController.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // MARK: - Properties
    
    var dataImage: Data?
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieFrom(term: "Superman")
    }
    
    // MARK: - TableView Data Source
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.movieCellIdentifier, for: indexPath) as? MovieTableViewCell else { return MovieTableViewCell() }
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        //cell.delegate = self
        
        return cell
    }
    
    // MARK: - Functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        getMovieFrom(term: searchTerm)
        searchBar.resignFirstResponder()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func getMovieFrom(term: String) {
        MovieController.searchMovies(query: term) { (movies) in
            self.movies = movies
            
        }
    }
    
    // MARK: - Delegate Function
    
//    func isFavorteMovieButtonTapped(_ sender: MovieTableViewCell) {
//        guard let indexPath = tableView.indexPath(for: sender) else { return }
//        guard let movie = sender.movie else { return }
//        ImageController.getImage(atURL: movie.posterURLString) { (image) in
//            guard let image = image else { return }
//            self.dataImage = UIImagePNGRepresentation(image)
//        }
//        guard let dataImage = dataImage else { return }
//        FavoritedMovieController.shared.addFavoriteWith(title: movie.title, overview: movie.overview, rating: movie.rating, posterImage: dataImage)
//    
//        tableView.reloadRows(at: [indexPath], with: .automatic)
//    
//}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let movie = movies[indexPath.row]
        if segue.identifier == Keys.toShowPosterKey {
            guard let detailVC = segue.destination as? MoviePosterViewController else { return }
            detailVC.movie = movie
        }
        if segue.identifier == Keys.mainListToDetailKey {
            guard let detailVC = segue.destination as? MovieDetailViewController else { return }
            detailVC.movie = movie
        }
        
    }

}


















