//
//  DataDown.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

class MovieProvider {

    enum URLType {
        case rate
        case date
        case grade

        var url: URL? {
            switch self {
            case .date:
                return URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=0")
            case .grade:
                return URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=1")
            case .rate:
                return URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=2")
            }
        }
    }
    
    func fetchMovie(url: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: url) else { return }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {return}
            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(apiResponse.movies)
            } catch(let error) {
                print("error :", error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    func fetchMovie(type: URLType, completion: @escaping ([Movie]) -> Void) {
        guard let url = type.url else { return }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {return}
            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(apiResponse.movies)
            } catch(let error) {
                print("error :", error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
