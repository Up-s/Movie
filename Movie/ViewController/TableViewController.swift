//
//  TableViewController.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    private let movieTableView = UITableView()
    private let movieTableViewCellIdentifier = "MovieTableViewCell"
    
    private var movieData: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/movies") else { return }
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.movieData = apiResponse.results
                print("----", self.movieData)
            } catch(let error) {
                print("asd", error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    private func configure() {
        movieTableView.dataSource = self
        
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: movieTableViewCellIdentifier)
        
        view.addSubview(movieTableView)
    }
    
    private func configureLayout() {
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        movieTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        movieTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        movieTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}


extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieTableViewCellIdentifier) as! MovieTableViewCell
        cell.poster = "collection"
        
        return cell
    }
}
