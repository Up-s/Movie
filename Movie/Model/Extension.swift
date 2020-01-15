//
//  Extension.swift
//  Movie
//
//  Created by Lee on 15/07/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

extension UIImageView {
  func fetchImage(with url: String) {
    guard let url = URL(string: url) else { return }
    
    let dataTask = URLSession.shared.dataTask(
      with: url,
      completionHandler: { [weak self] (data, response, error) in
        
        guard error == nil else { fatalError() }
        guard let header = response as? HTTPURLResponse,
          (200..<300) ~= header.statusCode
          else { fatalError() }
        guard let data = data else { return }
        let image = UIImage(data: data)
        DispatchQueue.main.async {
          self?.image = image
        }
      }
    )
    dataTask.resume()
  }
}
