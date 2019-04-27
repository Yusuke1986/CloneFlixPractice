//
//  HomeViewController.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/22.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var imgMovie1 = UIImageView()
    var imgMovie2 = UIImageView()
    var imgMovie3 = UIImageView()
    var imgList = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = UIView()
        view.backgroundColor = .darkGray
        
        // Process to make navigation transparent ナビゲーションを透明にする処理
        //self.navigationController!.navigationBar.alpha = 0.5
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        
        //TableView
        self.tableView = {
            let tableView = UITableView(frame: self.view.bounds, style: .plain)
            tableView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .singleLine
            self.view.addSubview(tableView)
            return tableView
        }()
        tableView?.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
        
        //for test
        let imageSample:UIImage = UIImage(named:"sample")! //poster_url
        imgMovie1 = UIImageView(image:imageSample)
        imgMovie1.isUserInteractionEnabled = true
        imgMovie1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeViewController.imageViewTapped(_:))))
        
        //for test
        let imageSample2:UIImage = UIImage(named:"sample2")! //poster_url
        imgMovie2 = UIImageView(image:imageSample2)
        
        //for test
        let imageSample3:UIImage = UIImage(named:"sample3")! //poster_url
        imgMovie3 = UIImageView(image:imageSample3)
        
        imgList.append(imageSample)
        imgList.append(imageSample2)
        imgList.append(imageSample3)


        loadConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    //ImageView click event
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        
        let nextvc = DetailViewController()
        
        nextvc.selectedURL = "https://directflix.vnz.la/titles/search?q=marvel"
        self.navigationController?.pushViewController(nextvc, animated: false)
    }
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imgList.count
    }
    
    //TableView Cell Format
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieTableViewCell
        cell.setCell(imglist: imgList)
        self.tableView?.rowHeight = 180
        return cell
    }
    
    //TableView Row select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    //Constraints
    func loadConstraints() {
        
        let tableView = self.tableView!
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        imgMovie1.translatesAutoresizingMaskIntoConstraints = false
        imgMovie1.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imgMovie1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        imgMovie2.translatesAutoresizingMaskIntoConstraints = false
        imgMovie2.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imgMovie2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        imgMovie2.translatesAutoresizingMaskIntoConstraints = false
        imgMovie2.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imgMovie2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
}
