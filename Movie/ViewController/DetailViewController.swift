//
//  DetailViewController.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private let detailTableView = UITableView(frame: .zero, style: .grouped)
    private let detailInfoCellIdentifier = "detailInfoTableViewCell"
    private let detailSynopsisCellIdentifier = "detailSynopsisTableViewCell"
    private let detailStaffCellIdentifier = "detailStaffTableViewCell"
    private let detailCommentCellIdentifier = "detailCommentTableViewCell"
    
    var id: String?
    var detailData: Detail?
    var comments: [Comment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // fetch
        fetch()
        
        // ui
        configure()
        configureLayout()
    }
    
    // MARK: - ui
    private func configure() {
        // tableview
        let refershControl = UIRefreshControl()
        refershControl.attributedTitle = NSAttributedString(string: "Reload...")
        refershControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        detailTableView.refreshControl = refershControl
        
        detailTableView.dataSource = self
        detailTableView.delegate = self
        detailTableView.allowsSelection = false
        
        detailTableView.register(DetailInfoTableViewCell.self, forCellReuseIdentifier: detailInfoCellIdentifier)
        detailTableView.register(DetailSynopsisTableViewCell.self, forCellReuseIdentifier: detailSynopsisCellIdentifier)
        detailTableView.register(DetailStaffTableViewCell.self, forCellReuseIdentifier: detailStaffCellIdentifier)
        detailTableView.register(DetailCommentTableViewCell.self, forCellReuseIdentifier: detailCommentCellIdentifier)
        
        view.addSubview(detailTableView)
        
        // notification
        NotificationCenter.default.addObserver(self, selector: #selector(fetchDetailNotiAction), name: FetchDetailNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(fetchCommentNotiAction), name: FetchCommentNotification, object: nil)
    }
    
    private func configureLayout() {
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        detailTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        detailTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - function
    @objc private func fetchDetailNotiAction(_ noti: Notification) {
        guard let response = noti.userInfo?["response"] as? Detail else { return }
        detailData = response
        DispatchQueue.main.async {
            self.detailTableView.reloadData()
        }
    }
    
    @objc private func fetchCommentNotiAction(_ noti: Notification) {
        guard let response = noti.userInfo?["response"] as? APICommentResponse else { return }
        comments = response.comments
        DispatchQueue.main.async {
            self.detailTableView.reloadData()
        }
    }
    
    private func fetch() {
        guard let id = id else { return }
        guard let movieURL = URL(string: "http://connect-boxoffice.run.goorm.io/movie?id=" + id) else {return}
        MovieService().fetchDetail(url: movieURL)
        guard let commentURL = URL(string: "http://connect-boxoffice.run.goorm.io/comments?movie_id=" + id) else {return}
        MovieService().fetchComment(url: commentURL)
    }
    
    @objc private func reloadData() {
        if detailTableView.refreshControl!.isRefreshing {
            fetch()
            detailTableView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - extension
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < 3 {
            return 1
        } else {
            return comments.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = detailData else {return UITableViewCell()}
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: detailInfoCellIdentifier) as? DetailInfoTableViewCell else {return UITableViewCell()}
            
            cell.posterImageView.fetchImage(with: data.image)
            cell.titleLabel.text = data.title
            cell.gradeImageView.image = UIImage(named: String(data.grade))
            cell.dateLabel.text = data.date
            cell.genreLabel.text = data.sumGenre
            cell.reserbationRatingLabel.text = data.sumRating
            cell.userRatingLabel.text = String(data.userRating)
            cell.ratingStarView.rating = CGFloat(data.userRating)
            cell.audienceLabel.text = data.changeAudience
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: detailSynopsisCellIdentifier) as? DetailSynopsisTableViewCell else {return UITableViewCell()}
            
            cell.synopsisTextView.text = data.synopsis
            
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: detailStaffCellIdentifier) as? DetailStaffTableViewCell else {return UITableViewCell()}
            
            cell.directorLabel.text = data.sumDirector
            cell.actorLabel.text = data.sumActor
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: detailCommentCellIdentifier) as? DetailCommentTableViewCell else {return UITableViewCell()}
            
            cell.writerLabel.text = comments[indexPath.row].writer
            cell.ratingStarView.rating = CGFloat(comments[indexPath.row].rating)
            cell.dateLabel.text = comments[indexPath.row].changeTimestamp
            cell.commentLabel.text = comments[indexPath.row].contents
            
            return cell
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else {
            return UITableView.automaticDimension
        }
    }
    
}
