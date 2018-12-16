//
//  DetailCommentTableViewCell.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class DetailCommentTableViewCell: UITableViewCell {
    private let userImageView = UIImageView()
    
    let userIdLabel = UILabel()
    let ratingStarView = RatingStarView()
    let dateLabel = UILabel()
    let commentLabel = UILabel()
    
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
        static let userIdLabelFontSize: CGFloat = 20
        static let dateLabelFontSize: CGFloat = 20
    }
    
    private func configure() {
        userImageView.image = UIImage(named: "user")
        self.addSubview(userImageView)
        
        userIdLabel.font = userIdLabel.font.withSize(FontSize.userIdLabelFontSize)
        self.addSubview(userIdLabel)
        
        self.addSubview(ratingStarView)
        
        dateLabel.font = dateLabel.font.withSize(FontSize.dateLabelFontSize)
        dateLabel.textColor = .gray
        self.addSubview(dateLabel)
        
        commentLabel.numberOfLines = 0
        self.addSubview(commentLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let userImageSize: CGFloat = 50
        static let ratingStarViewHeight: CGFloat = 15
        static let ratingStarViewWidth: CGFloat = 80
    }
    
    private func configureLayout() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: Standard.userImageSize).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: Standard.userImageSize).isActive = true
        
        userIdLabel.translatesAutoresizingMaskIntoConstraints = false
        userIdLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        userIdLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        ratingStarView.translatesAutoresizingMaskIntoConstraints = false
        ratingStarView.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        ratingStarView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ratingStarView.heightAnchor.constraint(equalToConstant: Standard.ratingStarViewHeight).isActive = true
        ratingStarView.widthAnchor.constraint(equalToConstant: Standard.ratingStarViewWidth).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: Standard.space).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Standard.space).isActive = true
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Standard.space).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Standard.space).isActive = true
        commentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        
    }
}
