//
//  DataDown.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

struct APIMovieResponse: Codable {
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
    
    var sumUserRating: String {
        return "평점 : " + "\(self.userRating)"
    }
    var sumReservationGrade: String {
        return "예매순위 : " + "\(self.reservationGrade)"
    }
    var sumReservationRate: String {
        return "예매율 : " + "\(self.reservationRate)"
    }
    var sumDate: String {
        return "개봉일 : " + "\(self.date)"
    }
}

enum OrderType {
    case grade
    case rate
    case date
    
    init(_ number: Int) {
        switch number {
        case 0: self = .grade
        case 1: self = .rate
        default: self = .date
        }
    }
    
    var type: String? {
        switch self {
        case .grade:
            return "예매율순"
        case .rate:
            return "큐레이션"
        case .date:
            return "개봉일순"
        }
    }
}

enum URLType {
    case rate
    case date
    case grade
    
    var url: URL? {
        switch self {
        case .grade:
            return URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=0")
        case .rate:
            return URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=1")
        case .date:
            return URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=2")
        }
    }
}
