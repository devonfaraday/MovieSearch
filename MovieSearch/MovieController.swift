//
//  MovieController.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

class MovieController {
    
    static func searchMovies(api_key: String = Keys.api_key, query: String, completion: @escaping (_ movies: [Movie]) -> Void) {
        var movies = [Movie]()
        guard let url = URL(string: Keys.baseURL) else { return }
        let urlParameters = ["api_key": api_key, "query": query]
        defer { completion(movies) }
        NetworkController.performRequest(forURL: url, httpMethod: .get, urlParameters: urlParameters) { (data, error) in
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data)) as? JSONDictionary,
                let moviesDictionary = jsonDictionary["results"] as? [JSONDictionary] else { return }
            if let error = error {
                NSLog(error.localizedDescription)
            } else {
                let movies = moviesDictionary.flatMap { Movie(dictionary: $0) }
                DispatchQueue.main.async {
                    completion(movies)
                }
            }
        }
    }
}
