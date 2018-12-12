//
//  TableViewController.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    // UI
    private let movieTableView = UITableView()
    
    // cellidentifier
    private let movieCellIdentifier = "MovieTableViewCell"
    
    // data
    private var movieData: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureLayout()
        dataFetch(url: MovieURL.reservationRateURL)
    }
    
    private func configure() {
        
        
        movieTableView.dataSource = self
        movieTableView.rowHeight = 150
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: movieCellIdentifier)
        view.addSubview(movieTableView)
    }
    
    private func configureLayout() {
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        movieTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        movieTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        movieTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func dataFetch(url: String) {
        let provider = MovieProvider()
        provider.fetchMovie(
            url: url,
            completion: { [weak self] movies in
                guard let self = self else { return }
                self.movieData = movies
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            }
        )
    }
}


extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movies = self.movieData
        
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCellIdentifier) as! MovieTableViewCell
        cell.posterImageView.fetchImage(with: movies[indexPath.row].thumb)
        cell.titleLabel.text = movies[indexPath.row].title
        cell.userRatingLabel.text = movies[indexPath.row].stringUserRating
        cell.reservationGradeLabel.text = movies[indexPath.row].stringReservationGrade
        cell.reservationRateLabel.text = movies[indexPath.row].stringReservationRate
        cell.dateLabel.text = movies[indexPath.row].stringDate
        
        return cell
    }
}

extension UIImageView {
    func fetchImage(with url: String) {
        guard let url = URL(string: url) else { return }
        
        let dataTask = URLSession.shared.dataTask(
            with: url,
            completionHandler: { [weak self] (data, response, error) in
                
                guard error == nil else { return }
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
