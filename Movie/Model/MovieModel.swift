//
//  MovieModel.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

/*
 {
 grade: 12,
 thumb: "http://movie.phinf.naver.net/20171201_181/1512109983114kcQVl_JPEG/movie_image.jpg?type=m99_141_2",
 reservation_grade: 1,
 title: "신과함께-죄와벌",
 reservation_rate: 35.5,
 user_rating: 7.98,
 date: "2017-12-20",
 id: "5a54c286e8a71d136fb5378e"
 }
 */

struct APIResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let grade: Int
    let thumb: String
    let reservationGrade: Int
    let title: String
    let reservationRate: Double
    let userRating: Double
    let data: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case grade, thumb, title, data, id
        case reservationGrade = "reservation_grade"
        case reservationRate = "reservation_rate"
        case userRating = "user_rating"
    }
}
