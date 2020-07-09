//
//  MovieCollectionViewCell.swift
//  Movie
//
//  Created by Ngoduc on 7/8/20.
//  Copyright © 2020 com.techmaster.D. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    public static let reuseIdentifier = "MovieCollectionViewCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.groupTableViewBackground
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .mainPink()
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: frame.height - 60)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 22, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
