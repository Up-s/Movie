//
//  DetailStaffTableViewCell.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class DetailStaffTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    
    let directorLabel = UILabel()
    let actorLabel = UILabel()
    
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
    }
    
    private func configure() {
        titleLabel.text = "감독/출연"
        titleLabel.font = titleLabel.font.withSize(FontSize.titleFontSize)
        self.addSubview(titleLabel)
        
        self.addSubview(directorLabel)
        
        actorLabel.numberOfLines = 0
        self.addSubview(actorLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        static let otherSpace: CGFloat = 20
    }
    
    private func configureLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        directorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        directorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.otherSpace).isActive = true
        
        actorLabel.translatesAutoresizingMaskIntoConstraints = false
        actorLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor).isActive = true
        actorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.otherSpace).isActive = true
        actorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        actorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
        
    }
}
