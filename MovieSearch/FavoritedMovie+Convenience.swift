//
//  FavoritedMovie+Convenience.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import CoreData

extension FavoritedMovie {
    
    @discardableResult convenience init(title: String, overview: String, rating: Double, posterImage: Data, isFavorite: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.overview = overview
        self.rating = rating
        self.posterImage = posterImage as NSData?
        
    }
}
