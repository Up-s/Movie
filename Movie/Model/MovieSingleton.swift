//
//  MovieSingleton.swift
//  Movie
//
//  Created by Kira on 17/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

struct MovieSingleton {
    static var shared: MovieSingleton = MovieSingleton()
    
    var movies: [Movie] = []
}
