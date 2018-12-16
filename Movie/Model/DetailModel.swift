//
//  DetailProvider.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

struct Detail: Codable {
    let id: String
    let grade: Int
    let actor: String
    let reservationRate: Double
    let genre: String
    let userRating: Double
    let synopsis: String
    let duration: Int
    let director, title: String
    let reservationGrade: Int
    let date: String
    let image: String
    let audience: Int
    
    enum CodingKeys: String, CodingKey {
        case id, grade, actor
        case reservationRate = "reservation_rate"
        case genre
        case userRating = "user_rating"
        case synopsis, duration, director, title
        case reservationGrade = "reservation_grade"
        case date, image, audience
    }
    
    var sumGenre: String {
        return genre + "/\(duration)분"
    }
    var sumRating: String {
        return "\(reservationGrade)위 \(reservationRate)%"
    }
    
    var changeAudience: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let tempAudience = formatter.string(from: audience as NSNumber) else {return ""}
        return tempAudience
    }
    
    var sumDirector: String {
        return "감독 : \(director)"
    }
    var sumActor: String {
        return "출연 : \(actor)"
    }
}
