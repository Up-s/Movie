//
//  MovieService.swift
//  Movie
//
//  Created by Kira on 17/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

let FetchMovieNotification = Notification.Name("FetchMovie")
let FetchDetailNotification = Notification.Name("FetchDetail")
let FetchCommentNotification = Notification.Name("FetchComment")

class MovieService {
    // 영화정보
    func fetchMovies(type: URLType) {
        guard let url = type.url else { return }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {return}
            do {
                let apiResponse = try JSONDecoder().decode(APIMovieResponse.self, from: data)
                NotificationCenter.default.post(name: FetchMovieNotification, object: nil, userInfo: ["response": apiResponse])
            } catch(let error) {
                print("error :", error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    // 상세정보
    func fetchDetail(url: URL) {
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {return}
            do {
                let apiResponse = try JSONDecoder().decode(Detail.self, from: data)
                NotificationCenter.default.post(name: FetchDetailNotification, object: nil, userInfo: ["response": apiResponse])
            } catch(let error) {
                print("error :", error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    // 한줄평가
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
}
