//
//  Keys.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

struct Keys {
    
    // MARK: - API Keys
    
    static let api_key = "e3cdbac157682e09c79e268f7afedcd5"
    
    static let baseURL = "https://api.themoviedb.org/3/search/movie"
    static let imageBaseURL = "http://image.tmdb.org/t/p/w500"
    
    static let titleKey = "title"
    static let overviewKey = "overview"
    static let ratingKey = "vote_average"
    static let posterKey = "poster_path"
    
    // MARK: - Reuse Identifier
    
    static let movieCellIdentifier = "movieCell"
}

    // MARK: - Typealias

typealias JSONDictionary = [String: Any]
