//
//  MovieModel.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

struct APIResponse: Codable {
    let movies: [Movie]
    let orderType: Int
    
    enum CodingKeys: String, CodingKey {
        case movies
        case orderType = "order_type"
    }
}

struct Movie: Codable {
    let reservationRate: Double
    let id: String
    let userRating: Double
    let grade: Int
    let date, title: String
    let reservationGrade: Int
    let thumb: String
    
    enum CodingKeys: String, CodingKey {
        case reservationRate = "reservation_rate"
        case id
        case userRating = "user_rating"
        case grade, date, title
        case reservationGrade = "reservation_grade"
        case thumb
    }
    
    var stringUserRating: String {
        return "평점 : " + "\(self.userRating)"
    }
    var stringReservationGrade: String {
        return "예매순위 : " + "\(self.reservationGrade)"
    }
    var stringReservationRate: String {
        return "예매율 : " + "\(self.reservationRate)"
    }
    var stringDate: String {
        return "개봉일 : " + "\(self.date)"
    }
}
