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
  private var orderType = OrderType.grade
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // fetch
    MovieService().fetchMovies(type: URLType.grade)
    
    // ui
    configure()
    configureLayout()
  }
  
  // MARK: - ui
  private func configure() {
    // navigation
    let typeBarButton = UIBarButtonItem(
      image: UIImage(named: "setting"),
      style: UIBarButtonItem.Style.plain,
      target: self,
      action: #selector(barButtonAction(_:)))
    typeBarButton.tintColor = .white
    navigationItem.rightBarButtonItem = typeBarButton
    
    // tableview
    let refershControl = UIRefreshControl()
    refershControl.attributedTitle = NSAttributedString(string: "Reload...")
    refershControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    movieTableView.refreshControl = refershControl
    
    movieTableView.dataSource = self
    movieTableView.delegate = self
    movieTableView.rowHeight = 150
    movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: movieTableViewCellIdentifier)
    view.addSubview(movieTableView)
    
    // notification
    NotificationCenter.default.addObserver(self, selector: #selector(fetchMovieNotiAction(_:)), name: FetchMovieNotification, object: nil)
  }
  
  private func configureLayout() {
    movieTableView.translatesAutoresizingMaskIntoConstraints = false
    movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    movieTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    movieTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    movieTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
  // MARK: - function
  @objc private func fetchMovieNotiAction(_ noti: Notification) {
    guard let response = noti.userInfo?["response"] as? APIMovieResponse else { return }
    MovieSingleton.shared.movies = response.movies
    orderType = OrderType.init(response.orderType)
    DispatchQueue.main.async {
      self.navigationItem.title = self.orderType.type
      self.movieTableView.reloadData()
    }
  }
  
  @objc private func barButtonAction(_ sender: UIButton) {
    AlertAction().alert(vc: self)
  }
  
  @objc private func reloadData() {
    if movieTableView.refreshControl!.isRefreshing {
      MovieService().fetchMovies(type: URLType.grade)
      movieTableView.refreshControl?.endRefreshing()
    }
  }
  
}

// MARK: - extension
extension TableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MovieSingleton.shared.movies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let movies = MovieSingleton.shared.movies
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: movieTableViewCellIdentifier) as? MovieTableViewCell else { return UITableViewCell() }
    
    cell.posterImageView.fetchImage(with: movies[indexPath.row].thumb)
    cell.titleLabel.text = movies[indexPath.row].title
    cell.gradeImageView.image = UIImage(named: String(movies[indexPath.row].grade))
    cell.userRatingLabel.text = movies[indexPath.row].sumUserRating
    cell.reservationGradeLabel.text = movies[indexPath.row].sumReservationGrade
    cell.reservationRateLabel.text = movies[indexPath.row].sumReservationRate
    cell.dateLabel.text = movies[indexPath.row].sumDate
    
    return cell
  }
}

extension TableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let movies = MovieSingleton.shared.movies
    
    let detailVC = DetailViewController()
    detailVC.id = movies[indexPath.row].id
    detailVC.navigationItem.title = movies[indexPath.row].title
    navigationController?.pushViewController(detailVC, animated: true)
  }
}

