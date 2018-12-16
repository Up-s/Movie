//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit


class MovieTableViewCell: UITableViewCell {
    let posterImageView = UIImageView()     // 영화포스터
    let titleLabel = UILabel()              // 영화제목
    let gradeImageView = UIImageView()      // 관람등급
    let userRatingLabel = UILabel()         // 사용자 평점
    let reservationGradeLabel = UILabel()   // 예매순위
    let reservationRateLabel = UILabel()    // 예매율
    let dateLabel = UILabel()               // 개봉일
    
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
    
    private struct FontSize {
        static let titleFontSize: CGFloat = 20
        static let otherFontSize: CGFloat = 12
        static let dateFontSize: CGFloat = 15
    }

    
    private func configure() {
        self.addSubview(posterImageView)
        
        titleLabel.font = titleLabel.font.withSize(FontSize.titleFontSize)
        titleLabel.clipsToBounds = false
        self.addSubview(titleLabel)
        
        self.addSubview(gradeImageView)
        
        userRatingLabel.font = userRatingLabel.font.withSize(FontSize.otherFontSize)
        userRatingLabel.textColor = .gray
        self.addSubview(userRatingLabel)
        
        reservationGradeLabel.font = reservationGradeLabel.font.withSize(FontSize.otherFontSize)
        reservationGradeLabel.textColor = .gray
        self.addSubview(reservationGradeLabel)
        
        reservationRateLabel.font = reservationRateLabel.font.withSize(FontSize.otherFontSize)
        reservationRateLabel.textColor = .gray
        self.addSubview(reservationRateLabel)
        
        dateLabel.font = dateLabel.font.withSize(FontSize.dateFontSize)
        self.addSubview(dateLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let titleTopSpace: CGFloat = 20
        static let gradeImageViewSize: CGFloat = 25
    }
    
    private func configureLayout() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.titleTopSpace).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        gradeImageView.translatesAutoresizingMaskIntoConstraints = false
        gradeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.titleTopSpace).isActive = true
        gradeImageView.leadingAnchor .constraint(equalTo: titleLabel.trailingAnchor, constant: Standard.space).isActive = true
        gradeImageView.widthAnchor.constraint(equalToConstant: Standard.gradeImageViewSize).isActive = true
        gradeImageView.heightAnchor.constraint(equalToConstant: Standard.gradeImageViewSize).isActive = true
        
        userRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        userRatingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Standard.space).isActive = true
        userRatingLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        reservationGradeLabel.translatesAutoresizingMaskIntoConstraints = false
        reservationGradeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Standard.space).isActive = true
        reservationGradeLabel.leadingAnchor.constraint(equalTo: userRatingLabel.trailingAnchor, constant: Standard.space).isActive = true
        
        reservationRateLabel.translatesAutoresizingMaskIntoConstraints = false
        reservationRateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Standard.space).isActive = true
        reservationRateLabel.leadingAnchor.constraint(equalTo: reservationGradeLabel.trailingAnchor, constant: Standard.space).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: userRatingLabel.bottomAnchor, constant: Standard.space).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Standard.space).isActive = true
    }
}
