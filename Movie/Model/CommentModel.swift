//
//  CommentProvider.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

struct APICommentResponse: Codable {
    let comments: [Comment]
}

struct Comment: Codable {
    let rating: Double
    let timestamp: Double
    let contents, writer, id: String
    
    var changeTimestamp: String {
        let date = NSDate(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd, hh:mm:ss"
        return dateFormatter.string(from: date as Date)
    }
}
