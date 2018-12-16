//
//  DetailCommentTableViewCell.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

private struct FontSize {
    static let userIdLabelFontSize: CGFloat = 20
    static let dateLabelFontSize: CGFloat = 15
}

private struct Standard {
    static let space: CGFloat = 10
    static let userImageSize: CGFloat = 50
    static let ratingStarViewHeight: CGFloat = 15
    static let ratingStarViewWidth: CGFloat = 80
}

class DetailCommentTableViewCell: UITableViewCell {
    let writerLabel = UILabel()                 // 작성자
    let ratingStarView = RatingStarView()       // 평점
    let dateLabel = UILabel()                   // 작성일
    let commentLabel = UILabel()                // 한줄평
    
    private let userImageView = UIImageView()
    
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
        userImageView.image = UIImage(named: "user")
        self.addSubview(userImageView)
        
        writerLabel.font = writerLabel.font.withSize(FontSize.userIdLabelFontSize)
        self.addSubview(writerLabel)
        
        self.addSubview(ratingStarView)
        
        dateLabel.font = dateLabel.font.withSize(FontSize.dateLabelFontSize)
        dateLabel.textColor = .gray
        self.addSubview(dateLabel)
        
        commentLabel.numberOfLines = 0
        self.addSubview(commentLabel)
    }
    
    private func configureLayout() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: Standard.userImageSize).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: Standard.userImageSize).isActive = true
        
        writerLabel.translatesAutoresizingMaskIntoConstraints = false
        writerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        writerLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        ratingStarView.translatesAutoresizingMaskIntoConstraints = false
        ratingStarView.leadingAnchor.constraint(equalTo: writerLabel.trailingAnchor, constant: Standard.space).isActive = true
        ratingStarView.centerYAnchor.constraint(equalTo: writerLabel.centerYAnchor).isActive = true
        ratingStarView.heightAnchor.constraint(equalToConstant: Standard.ratingStarViewHeight).isActive = true
        ratingStarView.widthAnchor.constraint(equalToConstant: Standard.ratingStarViewWidth).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: writerLabel.bottomAnchor, constant: Standard.space).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Standard.space).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Standard.space).isActive = true
        commentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
    }
}
