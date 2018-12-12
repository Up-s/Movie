//
//  DataDown.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import Foundation

class MovieProvider {
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
}
