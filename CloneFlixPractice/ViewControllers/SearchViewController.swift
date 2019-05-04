//
//  SearchViewController.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/22.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var searchBar = UISearchBar()
    let statusBarHeight = UIApplication.shared.statusBarFrame.height  // ステータスバーの高さ
    let cellId = "itemCell" // セル再利用のための固有名
    
    var imgList = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .darkGray
        
        searchBar.delegate = self
        searchBar.showsSearchResultsButton = true
        searchBar.keyboardType = UIKeyboardType.default
    
        searchBar.barStyle = UIBarStyle.default
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = "Search"
        searchBar.barTintColor = .black
        self.view.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let semaphore = DispatchSemaphore(value: 0)
        let queue = DispatchQueue.global(qos: .utility)
        let searchText = "\(directFlix.search.rawValue)\(searchBar.text!)"
        
        request(searchText , method: .get).responseJSON(queue: queue, completionHandler: { (response) in
            
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchMovie = try decoder.decode([SearchMovie].self, from: response.data!)
                
                for poster in searchMovie
                {
                    let url: NSURL = NSURL(string:poster.poster_url ?? "")!
                    let imageData :NSData = try NSData(contentsOf: url as URL)
                    let imgView: UIImage = UIImage(data: imageData as Data) ?? UIImage()
                    self.imgList.append(imgView)
                    
                    if self.imgList.count > 10 {
                        break
                    }
                }
                semaphore.signal()

            } catch {
                print("error:", error.localizedDescription)
            }
        })
        semaphore.wait()
        
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: statusBarHeight, width: self.view.frame.width, height: self.view.frame.size.height - statusBarHeight),
            collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.backgroundColor = UIColor.darkGray
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)  // セルの再利用のための設定
        
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    // 表示するアイテムの数を設定　Set the number of items to display（UICollectionViewDataSource が必要）
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imgList.count
    }
    
    // アイテムの大きさを設定　Set item size（UICollectionViewDelegateFlowLayout が必要）
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = self.view.frame.width / 4
        
        return CGSize(width: size, height: size)
    }
    
    // アイテム表示領域全体の上下左右の余白を設定　（UICollectionViewDelegateFlowLayout が必要）
    //　Set the top, bottom, left and right margins of the entire item display area
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let inset =  (self.view.frame.width / 5) / 7
        
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    // アイテムの上下の余白の最小値を設定 （UICollectionViewDelegateFlowLayout が必要）
    //Set the minimum value of the top and bottom margins of the item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (self.view.frame.width / 4) / 3
    }
    
    // アイテムの表示内容 Item display contents（UICollectionViewDataSource が必要）
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // アイテムを作成 Create item
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        
        // アイテムセルを再利用する際、前に追加していた要素（今回はラベル）を削除する
        //When reusing item cells, delete the element (in this case, the label) added previously
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let imgView = UIImageView(image: imgList[indexPath.row])
        
        cell.contentView.addSubview(imgView)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 180).isActive = true

        return cell
    }
    
    // アイテムタッチ時の処理 Item touch process（UICollectionViewDelegate が必要）
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nextvc = DetailViewController()
        
        
        
        
        nextvc.selectedURL = "\(directFlix.search.rawValue)"  //選択されたイメージのURLを追記する
        self.navigationController?.pushViewController(nextvc, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

