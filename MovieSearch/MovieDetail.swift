//
//  MovieDetail.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/19/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

struct MovieDetail {
    let budget: Int
    let revenue: Int
    let releaseDate: String
    let runtime: Int
    let id: Int
}

extension MovieDetail {
    init?(dictioanry: JSONDictionary) {
        guard let budget = dictioanry[Keys.budgetKey] as? Int,
            let revenue = dictioanry[Keys.revenueKey] as? Int,
            let releaseDate = dictioanry[Keys.releaseDateKey] as? String,
            let runtime = dictioanry[Keys.runtimeKey] as? Int,
        let id = dictioanry[Keys.idKey] as? Int else { return nil }
        self.init(budget: budget, revenue: revenue, releaseDate: releaseDate, runtime: runtime, id: id)
    }
}
