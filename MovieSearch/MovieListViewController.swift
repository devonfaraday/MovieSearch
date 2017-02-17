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

}
