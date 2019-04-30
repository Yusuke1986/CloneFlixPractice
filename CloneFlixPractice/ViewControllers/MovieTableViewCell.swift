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
    var imgList = [UIImage]()
    var imageTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier )

        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        flowLayout.itemSize = CGSize(width: 120, height: 180)
        
        
        collectionView = UICollectionView(frame: self.contentView.bounds, collectionViewLayout: flowLayout)
        contentView.addSubview(collectionView!)
        collectionView?.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectionView?.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        
        if imgList.count > indexPath.row
        {
            cell.configure(img: imgList[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.imageTap?()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imglist: [UIImage], imageTap: @escaping () -> Void) {
       
        self.imageTap = imageTap
        for img in imglist {
            imgList.append(img)
        }
        
        
        
        
       
//        collectionView?.performBatchUpdates({ () -> Void in
//            
//            let items = [IndexPath(item: 0, section: 0)]
//            self.collectionView?.insertItems(at: items)
//        }, completion:nil)
        
        
    }
    
}
