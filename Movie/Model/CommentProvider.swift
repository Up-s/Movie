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

let FetchCommentNotification = Notification.Name("FetchComment")

func fetchComment(url: URL) {
    let session = URLSession(configuration: .default)
    let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        guard let data = data else {return}
        do {
            let apiResponse = try JSONDecoder().decode(APICommentResponse.self, from: data)
            NotificationCenter.default.post(name: FetchCommentNotification, object: nil, userInfo: ["response": apiResponse])
        } catch(let error) {
            print("error :", error.localizedDescription)
        }
    }
    dataTask.resume()
}
