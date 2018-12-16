//
//  DetailSynopsisTableViewCell.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

private struct Standard {
    static let space: CGFloat = 10
}

class DetailSynopsisTableViewCell: UITableViewCell {
    let synopsisTextView = UILabel()        // 줄거리
    
    private let labelSynopsis = UILabel()
    
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
        labelSynopsis.text = "줄거리"
        labelSynopsis.font = labelSynopsis.font.withSize(30)
        self.addSubview(labelSynopsis)
        
        synopsisTextView.numberOfLines = 0
        self.addSubview(synopsisTextView)
    }
    
    private func configureLayout() {
        labelSynopsis.translatesAutoresizingMaskIntoConstraints = false
        labelSynopsis.topAnchor.constraint(equalTo: self.topAnchor, constant: Standard.space).isActive = true
        labelSynopsis.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        labelSynopsis.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        labelSynopsis.bottomAnchor.constraint(equalTo: synopsisTextView.topAnchor, constant: -Standard.space).isActive = true
        
        synopsisTextView.translatesAutoresizingMaskIntoConstraints = false
        synopsisTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Standard.space).isActive = true
        synopsisTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Standard.space).isActive = true
        synopsisTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Standard.space).isActive = true
    }
}
