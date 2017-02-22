//
//  FavoritedMovieController.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import CoreData

class FavoritedMovieController {
    
    static let shared = FavoritedMovieController()
    
    
    // MARK: - Create
    func addFavoriteWith(title: String, overview: String, rating: Double, posterImage: Data) {
        let _ = FavoritedMovie(title: title, overview: overview, rating: rating, posterImage: posterImage)
        saveToPersistentData()
     }
    
    // MARK: - Read
    
    var favoritedMovies: [FavoritedMovie] {
        let request: NSFetchRequest<FavoritedMovie> = FavoritedMovie.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }

    // MARK: - Update
    func toggleIsFavorite(movie: FavoritedMovie) {
        movie.isFavorite = !movie.isFavorite
        saveToPersistentData()
    }
    
    
    // MARK: - Delete
    func delete(movie: FavoritedMovie) {
        let moc = CoreDataStack.context
        moc.delete(movie)
        saveToPersistentData()
    }
    
    // MARK: - Saving
    
    func saveToPersistentData() {
        let moc = CoreDataStack.context
            do {
                try moc.save()
            } catch let error {
                NSLog(error.localizedDescription)
        }
        }
}
