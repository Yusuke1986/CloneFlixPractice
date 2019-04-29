//
//  HomeViewController.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/22.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit
import Alamofire

enum directFlix: String {
    case search = "https://directflix.vnz.la/titles/search?q="
    case tvshow = "https://directflix.vnz.la/titles/tv-shows"
    case movie = "https://directflix.vnz.la/titles/movies"
    case recentlyAdded = "https://directflix.vnz.la/titles/recently-added"
    case trendingNow = "https://directflix.vnz.la/titles/trending-now"
    
}


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var imgList = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = UIView()
        view.backgroundColor = .darkGray
        
        let semaphore = DispatchSemaphore(value: 0)
        let queue = DispatchQueue.global(qos: .utility)
        
        request(directFlix.movie.rawValue , method: .get).responseJSON(queue: queue, completionHandler: { (response) in
        
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
        
        loadConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    //TableView Cell Format
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieTableViewCell
        cell.configure(imglist: imgList)
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
    }
    
}
