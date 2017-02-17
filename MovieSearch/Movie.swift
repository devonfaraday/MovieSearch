//
//  Movie.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

struct Movie {
    
    // MARK: - Properties
    
    let title: String
    let overview: String
    let rating: Double
    let posterURLString: String
}

extension Movie {
    
    // MARK: - Failable Initializer
    
    init?(dictionary: JSONDictionary) {
        guard let title = dictionary[Keys.titleKey] as? String,
            let overview = dictionary[Keys.overviewKey] as? String,
            let rating = dictionary[Keys.ratingKey] as? Double,
            let posterURLString = dictionary[Keys.posterKey] as? String else { return nil }
        
        self.init(title: title, overview: overview, rating: rating, posterURLString: posterURLString)
    }
}
