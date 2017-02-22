//
//  FavoiteMoviesTableViewController.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class FavoiteMoviesTableViewController: UITableViewController {
   
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritedMovieController.shared.favoritedMovies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.favoriteMovieCellIdentifier, for: indexPath) as? FavoriteMovieTableViewCell else { return FavoriteMovieTableViewCell() }
            let favMovie = FavoritedMovieController.shared.favoritedMovies[indexPath.row]
        
        cell.favMovie = favMovie
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let favMovie = FavoritedMovieController.shared.favoritedMovies[indexPath.row]
            FavoritedMovieController.shared.delete(movie: favMovie)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        if segue.identifier == Keys.favoriteToDetailKey {
            guard let detailVC = segue.destination as? MovieDetailViewController else { return }
            let favMovie = FavoritedMovieController.shared.favoritedMovies[indexPath.row]
            detailVC.favMovie = favMovie
        }
    }
}
