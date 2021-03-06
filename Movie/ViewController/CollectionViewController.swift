//
//  CollectionViewController.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

private struct Standard {
    static let collectionViewSpace: CGFloat = 10
    static let collectionViewHeight: CGFloat = 300
}

class CollectionViewController: UIViewController {
    private let movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let movieCollectionViewCellIdentifier = "MovieCollectionViewCell"
    private var orderType = OrderType.grade
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureLayout()
    }
    
    // MARK: - UI
    private func configure() {
        // navigation
        let typeBarButton = UIBarButtonItem(
            image: UIImage(named: "setting"),
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(barButtonAction(_:)))
        typeBarButton.tintColor = .white
        navigationItem.rightBarButtonItem = typeBarButton
        
        // collectionview
        let refershControl = UIRefreshControl()
        refershControl.attributedTitle = NSAttributedString(string: "Reload...")
        refershControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        movieCollectionView.refreshControl = refershControl
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.backgroundColor = .white
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCollectionViewCellIdentifier)
        view.addSubview(movieCollectionView)
        
        // notification
        NotificationCenter.default.addObserver(self, selector: #selector(fetchMovieNotiAction(_:)), name: FetchMovieNotification, object: nil)
    }
    
    private func configureLayout() {
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - function
    @objc private func fetchMovieNotiAction(_ noti: Notification) {
        guard let response = noti.userInfo?["response"] as? APIMovieResponse else { return }
        MovieSingleton.shared.movies = response.movies
        orderType = OrderType.init(response.orderType)
        DispatchQueue.main.async {
            self.navigationItem.title = self.orderType.type
            self.movieCollectionView.reloadData()
        }
    }
    
    @objc private func barButtonAction(_ sender: UIButton) {
        AlertAction().alert(vc: self)
    }
    
    @objc private func reloadData() {
        if movieCollectionView.refreshControl!.isRefreshing {
            MovieService().fetchMovies(type: URLType.grade)
            movieCollectionView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - extension
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieSingleton.shared.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movies = MovieSingleton.shared.movies
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCollectionViewCellIdentifier, for: indexPath) as? MovieCollectionViewCell else {return UICollectionViewCell()}
        
        cell.posterImageView.fetchImage(with: movies[indexPath.item].thumb)
        cell.titleLabel.text = movies[indexPath.item].title
        cell.gradeImageView.image = UIImage(named: String(movies[indexPath.item].grade))
        cell.userRatingLabel.text = movies[indexPath.item].sumUserRating
        cell.reservationGradeLabel.text = movies[indexPath.item].sumReservationGrade
        cell.reservationRateLabel.text = movies[indexPath.item].sumReservationRate
        cell.dateLabel.text = movies[indexPath.item].sumDate
        
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movies = MovieSingleton.shared.movies
        
        let detailVC = DetailViewController()
        detailVC.id = movies[indexPath.item].id
        detailVC.navigationItem.title = movies[indexPath.item].title
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (UIScreen.main.bounds.width - (Standard.collectionViewSpace * 3)) / 2,
            height: Standard.collectionViewHeight
        )
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: Standard.collectionViewSpace,
            left: Standard.collectionViewSpace,
            bottom: Standard.collectionViewSpace,
            right: Standard.collectionViewSpace
        )
    }
}
