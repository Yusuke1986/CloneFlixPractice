//
//  MovieTableViewCell.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/26.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView?
    var imgView = UIImageView()
    var imgList = [UIImage]()
    //var lblTitle = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier )
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        collectionView = UICollectionView(frame: self.contentView.bounds, collectionViewLayout: flowLayout)
        contentView.addSubview(collectionView!)
        collectionView?.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
//        contentView.addSubview(imgView)
//        contentView.addSubview(lblTitle)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
//        lblTitle.translatesAutoresizingMaskIntoConstraints = false
//        lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        lblTitle.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        lblTitle.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! MovieCollectionViewCell
        
        collection.setupcell(imglist: imgList)
        
        return collection
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(imglist: [UIImage]) {
        
        for img in imglist {
            imgList.append(img)
        }
    }
    
}
