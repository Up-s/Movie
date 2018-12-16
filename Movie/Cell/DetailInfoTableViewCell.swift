//
//  DetailInfoTableViewCell.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class DetailInfoTableViewCell: UITableViewCell {
    let posterImageView = UIImageView()     // 영화포스터
    let titleLabel = UILabel()              // 영화제목
    let gradeImageView = UIImageView()      // 관람등급
    let dateLabel = UILabel()               // 개봉일
    let genreLabel = UILabel()              // 장르
    let reserbationRatingLabel = UILabel()  // 예매율
    let userRatingLabel = UILabel()         // 평점
    let ratingStarView = RatingStarView()   // 별점
    let audienceLabel = UILabel()           // 누적관객수
    
    private let guardView1 = UIView()
    private let guardView2 = UIView()
    
    private let labelReservationRating = UILabel()
    private let labelUserRating = UILabel()
    private let labelAudience = UILabel()
    
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
        
        static let dateFontSize: CGFloat = 15
        
        static let labelFontSize: CGFloat = 20
        static let otherFontSize: CGFloat = 12
    }
    
    private func configure() {
        self.addSubview(posterImageView)
        
        self.addSubview(titleLabel)
        
        self.addSubview(gradeImageView)
        
        self.addSubview(titleLabel)
        
        self.addSubview(dateLabel)
        
        self.addSubview(genreLabel)
        
        guardView1.backgroundColor = .gray
        self.addSubview(guardView1)
        
        guardView2.backgroundColor = .gray
        self.addSubview(guardView2)
        
        labelReservationRating.text = "예매율"
        labelReservationRating.textAlignment = .center
        labelReservationRating.font = labelReservationRating.font.withSize(FontSize.labelFontSize)
        self.addSubview(labelReservationRating)
        
        reserbationRatingLabel.textAlignment = .center
        reserbationRatingLabel.font = reserbationRatingLabel.font.withSize(FontSize.otherFontSize)
        self.addSubview(reserbationRatingLabel)
        
        labelUserRating.text = "평점"
        labelUserRating.textAlignment = .center
        labelUserRating.font = labelUserRating.font.withSize(FontSize.labelFontSize)
        self.addSubview(labelUserRating)
        
        userRatingLabel.textAlignment = .center
        userRatingLabel.font = userRatingLabel.font.withSize(FontSize.otherFontSize)
        self.addSubview(userRatingLabel)
        
        self.addSubview(ratingStarView)
        
        labelAudience.text = "누적관객수"
        labelAudience.textAlignment = .center
        labelAudience.font = labelAudience.font.withSize(FontSize.labelFontSize)
        self.addSubview(labelAudience)
        
        audienceLabel.textAlignment = .center
        audienceLabel.font = audienceLabel.font.withSize(FontSize.otherFontSize)
        self.addSubview(audienceLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let titleTopSpace: CGFloat = 70
        static let guardViewSpace: CGFloat = 70
        static let topSpace: CGFloat = 20
        
        static let posterImageViewWdith: CGFloat = 130
        static let posterImageViewHeight: CGFloat = 200
        static let gradeImageViewSize: CGFloat = 25
        static let guardViewWidth: CGFloat = 1
        static let ratingStarViewHeight: CGFloat = 15
        static let ratingStarViewWidth: CGFloat = 80
    }
    
    private func configureLayout() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: Standard.posterImageViewWdith).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: Standard.posterImageViewHeight).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.titleTopSpace).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        gradeImageView.translatesAutoresizingMaskIntoConstraints = false
        gradeImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Standard.space).isActive = true
        gradeImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        gradeImageView.widthAnchor.constraint(equalToConstant: Standard.gradeImageViewSize).isActive = true
        gradeImageView.heightAnchor.constraint(equalToConstant: Standard.gradeImageViewSize).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        genreLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        guardView1.translatesAutoresizingMaskIntoConstraints = false
        guardView1.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: Standard.space).isActive = true
        guardView1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        guardView1.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -Standard.guardViewSpace).isActive = true
        guardView1.widthAnchor.constraint(equalToConstant: Standard.guardViewWidth).isActive = true
        
        guardView2.translatesAutoresizingMaskIntoConstraints = false
        guardView2.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: Standard.space).isActive = true
        guardView2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        guardView2.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: Standard.guardViewSpace).isActive = true
        guardView2.widthAnchor.constraint(equalToConstant: Standard.guardViewWidth).isActive = true
        
        // 예매율
        labelReservationRating.translatesAutoresizingMaskIntoConstraints = false
        labelReservationRating.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: Standard.topSpace).isActive = true
        labelReservationRating.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        labelReservationRating.trailingAnchor.constraint(equalTo: guardView1.leadingAnchor).isActive = true
        
        reserbationRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        reserbationRatingLabel.topAnchor.constraint(equalTo: labelReservationRating.bottomAnchor).isActive = true
        reserbationRatingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        reserbationRatingLabel.trailingAnchor.constraint(equalTo: guardView1.leadingAnchor).isActive = true
        
        // 평점
        labelUserRating.translatesAutoresizingMaskIntoConstraints = false
        labelUserRating.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: Standard.space).isActive = true
        labelUserRating.leadingAnchor.constraint(equalTo: guardView1.trailingAnchor).isActive = true
        labelUserRating.trailingAnchor.constraint(equalTo: guardView2.leadingAnchor).isActive = true
        
        userRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        userRatingLabel.topAnchor.constraint(equalTo: labelUserRating.bottomAnchor).isActive = true
        userRatingLabel.leadingAnchor.constraint(equalTo: guardView1.trailingAnchor).isActive = true
        userRatingLabel.trailingAnchor.constraint(equalTo: guardView2.leadingAnchor).isActive = true
        
        ratingStarView.translatesAutoresizingMaskIntoConstraints = false
        ratingStarView.topAnchor.constraint(equalTo: userRatingLabel.bottomAnchor).isActive = true
        ratingStarView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ratingStarView.heightAnchor.constraint(equalToConstant: Standard.ratingStarViewHeight).isActive = true
        ratingStarView.widthAnchor.constraint(equalToConstant: Standard.ratingStarViewWidth).isActive = true
        
        // 누적관객수
        labelAudience.translatesAutoresizingMaskIntoConstraints = false
        labelAudience.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: Standard.topSpace).isActive = true
        labelAudience.leadingAnchor.constraint(equalTo: guardView2.trailingAnchor).isActive = true
        labelAudience.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        audienceLabel.translatesAutoresizingMaskIntoConstraints = false
        audienceLabel.topAnchor.constraint(equalTo: labelAudience.bottomAnchor).isActive = true
        audienceLabel.leadingAnchor.constraint(equalTo: guardView2.trailingAnchor).isActive = true
        audienceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
