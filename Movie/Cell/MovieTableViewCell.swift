//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    private let posterImageView = UIImageView()     // 영화포스터
    private let titleLabel = UILabel()              // 영화제목
    private let gradeImageView = UIImageView()      // 관람등급
    private let userRatingLabel = UILabel()         // 사용자 평점
    private let reservationGradeLabel = UILabel()   // 예매순위
    private let reservationRateLabel = UILabel()    // 예매율
    private let dataLabel = UILabel()               // 개봉일
    
    var poster: String = "" {
        didSet { posterImageView.image = UIImage(named: poster) }
    }
    var title: String = "" {
        didSet { titleLabel.text = title }
    }
    var grade: Int = 0 {
        didSet { gradeImageView.image = UIImage(named: String(grade)) }
    }
    var userRating: Double = 0 {
        didSet { userRatingLabel.text = String(userRating) }
    }
    var reservationGrade: Int = 0 {
        didSet { reservationGradeLabel.text = String(reservationGrade) }
    }
    var reservationRate: Double = 0 {
        didSet { reservationRateLabel.text = String(reservationRate) }
    }
    var data: String = "" {
        didSet { dataLabel.text = data }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func configure() {
        self.addSubview(posterImageView)
        
    }
    
    private struct Standard {
        static let space: CGFloat = 10
    }
    
    private func configureLayout() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
