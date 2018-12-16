//
//  MovieCollectionViewCell.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

private struct FontSize {
    static let titleFontSize: CGFloat = 20
    static let otherFontSize: CGFloat = 12
    static let dateFontSize: CGFloat = 15
}

private struct Standard {
    static let gradeImageSpace: CGFloat = 5
    static let gradeImageViewSize: CGFloat = 30
}

class MovieCollectionViewCell: UICollectionViewCell {
    let posterImageView = UIImageView()     // 영화포스터
    let titleLabel = UILabel()              // 영화제목
    let gradeImageView = UIImageView()      // 관람등급
    let userRatingLabel = UILabel()         // 사용자 평점
    let reservationGradeLabel = UILabel()   // 예매순위
    let reservationRateLabel = UILabel()    // 예매율
    let dateLabel = UILabel()               // 개봉일
    
    private let centerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        posterImageView.contentMode = .scaleAspectFit
        self.addSubview(posterImageView)
        
        self.addSubview(gradeImageView)
        
        titleLabel.textAlignment = .center
        titleLabel.font = titleLabel.font.withSize(FontSize.titleFontSize)
        self.addSubview(titleLabel)
        
        reservationGradeLabel.font = reservationGradeLabel.font.withSize(FontSize.otherFontSize)
        reservationGradeLabel.textColor = .gray
        self.addSubview(reservationGradeLabel)
        
        centerLabel.font = centerLabel.font.withSize(FontSize.otherFontSize)
        centerLabel.text = " / "
        centerLabel.textAlignment = .center
        centerLabel.textColor = .gray
        self.addSubview(centerLabel)
        
        reservationRateLabel.font = reservationRateLabel.font.withSize(FontSize.otherFontSize)
        reservationRateLabel.textColor = .gray
        self.addSubview(reservationRateLabel)
        
        dateLabel.font = dateLabel.font.withSize(FontSize.dateFontSize)
        self.addSubview(dateLabel)
    }
    
    private func configureLayout() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        posterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        
        gradeImageView.translatesAutoresizingMaskIntoConstraints = false
        gradeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.gradeImageSpace).isActive = true
        gradeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.gradeImageSpace).isActive = true
        gradeImageView.widthAnchor.constraint(equalToConstant: Standard.gradeImageViewSize).isActive = true
        gradeImageView.heightAnchor.constraint(equalToConstant: Standard.gradeImageViewSize).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: centerLabel.topAnchor).isActive = true
        
        reservationGradeLabel.translatesAutoresizingMaskIntoConstraints = false
        reservationGradeLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor).isActive = true
        reservationGradeLabel.trailingAnchor.constraint(equalTo: centerLabel.leadingAnchor).isActive = true
        
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        centerLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor).isActive = true
        centerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        reservationRateLabel.translatesAutoresizingMaskIntoConstraints = false
        reservationRateLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor).isActive = true
        reservationRateLabel.leadingAnchor.constraint(equalTo: centerLabel.trailingAnchor).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
