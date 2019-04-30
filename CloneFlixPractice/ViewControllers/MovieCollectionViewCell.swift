//
//  MovieCollectionViewCell.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/27.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    var imgView = UIImageView()
    
    func configure(img: UIImage) {
        
        imgView.image = img
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        imgView.isUserInteractionEnabled = true
        
        self.addSubview(imgView)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
}
