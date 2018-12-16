//
//  RatingStarView.swift
//  Movie
//
//  Created by Kira on 16/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

class RatingStarView: UIView {
    let colorView = UIView()
    let starImageView = UIImageView()
    
    var rating: CGFloat = 0 {
        didSet {
            configureLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        colorView.backgroundColor = .red
        self.addSubview(colorView)
        
        let starImage = UIImage(named: "star")
        starImageView.image = starImage
        self.addSubview(starImageView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
    }
    
    private func configureLayout() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        colorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: rating / 10.0).isActive = true
        
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        starImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        starImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
