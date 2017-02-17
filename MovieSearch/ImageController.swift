//
//  ImageController.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func getImage(atURL urlString: String, completion: @escaping (UIImage?) -> Void ) {
        guard let url = URL(string: Keys.imageBaseURL)?.appendingPathComponent(urlString) else { fatalError("no url for sprite") }
        NetworkController.performRequest(forURL: url, httpMethod: .get) { (data, error) in
            if let error = error {
                print("error getting sprite:\n\(error.localizedDescription)")
            }
            guard let data = data,
                let image = UIImage(data: data) else {
                    completion(nil)
                    return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
