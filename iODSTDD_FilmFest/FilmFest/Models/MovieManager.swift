//
//  MovieManager.swift
//  FilmFest
//
//  Created by Sangkon Han on 02/09/2018.
//  Copyright © 2018 Sigmadream. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int { return moviesToSeeArray.count }
    var moviesToSeenCount: Int { return moviesSeenArray.count }
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie: Movie) {
        moviesToSeeArray.append(movie)
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func checkOffMovieAtIndex(index: Int) {
        guard index < moviesToSeeCount else {return}
                
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie)
    }
    
    func checkedOffMovieAtIndex(index:Int) -> Movie {
        return moviesSeenArray[index]
    }
    
}
