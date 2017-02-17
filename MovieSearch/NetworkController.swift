//
//  NetworkController.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

class NetworkController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    static func performRequest(forURL url: URL,
                               httpMethod: HTTPMethod,
                               urlParameters: [String: String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        let requestURL = self.getURL(byAddingParameters: urlParameters, toURL: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            completion?(data, error)
        }
        dataTask.resume()
    }
    
    static func getURL(byAddingParameters parametrs: [String: String]?, toURL url: URL) -> URL  {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parametrs?.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        guard let url = components?.url else { fatalError("URL is nil") }
        return url
    }
}
