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
    
    static let baseURLForSearch = "https://api.themoviedb.org/3/search/movie"
    // detailBaseURL will add a component of the movie id  /<id>
    static let detailsBaseURL = "https://api.themoviedb.org/3/movie"
    static let imageBaseURL = "http://image.tmdb.org/t/p/w500"
    
    static let titleKey = "title"
    static let overviewKey = "overview"
    static let ratingKey = "vote_average"
    static let posterKey = "poster_path"
    static let idKey = "id"
    static let budgetKey = "budget"
    static let releaseDateKey = "release_date"
    static let revenueKey = "revenue"
    static let runtimeKey = "runtime"
    
    
    // MARK: - Reuse Identifier
    
    static let movieCellIdentifier = "movieCell"
    static let favoriteMovieCellIdentifier = "favoriteMovieCell"
    
    // MARK: - Core Data Keys
    
    static let appNameKey = "MovieSearch"
    
    // MARK: - Segues
    
    static let favoriteToDetailKey = "toShowMovieFromFavorites"
    static let toShowPosterKey = "toShowPoster"
    static let mainListToDetailKey = "toShowDetailFromMainList"
    
}

    // MARK: - Typealias

typealias JSONDictionary = [String: Any]
