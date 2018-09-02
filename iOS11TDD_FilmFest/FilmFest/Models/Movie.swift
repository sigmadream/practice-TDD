//
//  Movie.swift
//  FilmFest
//
//  Created by Sangkon Han on 02/09/2018.
//  Copyright © 2018 Sigmadream. All rights reserved.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
