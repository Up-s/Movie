//
//  CollectionViewController.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    private let movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let movieCollectionViewCellIdentifier = "MovieCollectionViewCell"
    
    private var movies: [Movie] = []
    private var orderType: OrderType = OrderType.grade
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureLayout()
        
    }
    
    private func configure() {
        fetchMovies(type: URLType.grade)
        
        // navigate
        let typeBarButton = UIBarButtonItem(
            image: UIImage(named: "setting"),
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(barButtonAction))
        typeBarButton.tintColor = .white
        navigationItem.rightBarButtonItem = typeBarButton
        
        // collectionview
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.backgroundColor = .white
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCollectionViewCellIdentifier)
        view.addSubview(movieCollectionView)
        
        // notification
        NotificationCenter.default.addObserver(self, selector: #selector(fetchMovieNotiAction), name: FetchMovieNotification, object: nil)
    }
    
    private struct Standard {
        static let collectionViewSpace: CGFloat = 10
        static let collectionViewHeight: CGFloat = 300
    }
    
    private func configureLayout() {
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc private func fetchMovieNotiAction(_ noti: Notification) {
        guard let response = noti.userInfo?["response"] as? APIMovieResponse else { return }
        movies = response.movies
        orderType = OrderType.init(response.orderType)
        DispatchQueue.main.async {
            self.navigationItem.title = self.orderType.type
            self.movieCollectionView.reloadData()
        }
    }
    
    @objc private func barButtonAction(_ sender: UIButton) {
        alert(vc: self)
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCollectionViewCellIdentifier, for: indexPath) as? MovieCollectionViewCell else {return UICollectionViewCell()}
        
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
