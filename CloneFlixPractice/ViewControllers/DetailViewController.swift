//
//  DetailViewController.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/22.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    var imgMovie = UIImageView()
    var lblInfo = UILabel()
    var btnPlay = UIButton()
    var txtDetail = UITextView()
    var lblActors = UILabel()
    var lblDirector = UILabel()
  
    var selectedURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .darkGray
        
        //let params = ["id": "c7cca58c-e0e9-44c5-89e9-2de265409cc6"] as [String : Any]
        
        if selectedURL != nil
        {
            request(selectedURL!, method: .get).responseJSON(completionHandler: { (response) in
                
                let decoder: JSONDecoder = JSONDecoder()
                do {
                    let searchMovie = try decoder.decode([SearchMovie].self, from: response.data!)
                    
                    let url: NSURL = NSURL(string:searchMovie[0].poster_url ?? "")!
                    let imageData :NSData = try NSData(contentsOf: url as URL)
                    self.imgMovie.image = UIImage(data: imageData as Data)
                    
                    self.lblInfo.text = searchMovie[0].series_years
                    self.txtDetail.text = searchMovie[0].plot
                    self.lblActors.text = "Actors: \(searchMovie[0].actors)"
                    self.lblDirector.text = "Director: \(searchMovie[0].director)"
                    
                } catch {
                    print("error:", error.localizedDescription)
                }
            })
        }
        
        
        //ImageView
        if imgMovie.image != nil {
            let screenWidth:CGFloat = view.frame.size.width
            let screenHeight:CGFloat = view.frame.size.height
            let imgWidth:CGFloat = imgMovie.image!.size.width
            let imgHeight:CGFloat = imgMovie.image!.size.height
            let scale:CGFloat = screenWidth / imgWidth
            let rect:CGRect =
                CGRect(x:0, y:0, width:imgWidth*scale, height:imgHeight*scale)
            imgMovie.frame = rect
            imgMovie.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        }
        
        view.addSubview(imgMovie)
        
        //Label Info
        lblInfo.textAlignment = .center
        view.addSubview(lblInfo)
        
        //Button
        btnPlay.backgroundColor = .red
        btnPlay.setTitle("Play", for: .normal)
        btnPlay.setTitleColor(.white, for: .normal)
        btnPlay.addTarget(self, action: #selector(btnPlayPush), for: .touchUpInside)
        view.addSubview(btnPlay)
        
        //TextDetail
        txtDetail.isScrollEnabled = false
        txtDetail.font = .systemFont(ofSize: 20)
        txtDetail.backgroundColor = .darkGray
        view.addSubview(txtDetail)
        
        //Label Actor
        view.addSubview(lblActors)
        
        //Label Director
        view.addSubview(lblDirector)
        
        loadConstraints()
    }
    
    @objc func btnPlayPush(sender: UIButton) {
        //source_url
        self.navigationController?.popViewController(animated: false)
    }
    
    func loadConstraints() {
        
        imgMovie.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            imgMovie.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50.0),
            imgMovie.widthAnchor.constraint(equalToConstant: 200),
            imgMovie.heightAnchor.constraint(equalToConstant: 280),
            imgMovie.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        lblInfo.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            lblInfo.topAnchor.constraint(equalTo: imgMovie.bottomAnchor, constant: 10.0),
            lblInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            lblInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            lblInfo.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        btnPlay.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            btnPlay.topAnchor.constraint(equalTo: lblInfo.bottomAnchor, constant: 10.0),
            btnPlay.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            btnPlay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            btnPlay.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        txtDetail.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints([
            txtDetail.topAnchor.constraint(equalTo: btnPlay.bottomAnchor, constant: 10.0),
            txtDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            txtDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            txtDetail.heightAnchor.constraint(equalToConstant: 100)
            ])
        
//        let height = txtDetail.sizeThatFits(CGSize(width: txtDetail.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height
//        txtDetail.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        lblActors.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            lblActors.topAnchor.constraint(equalTo: txtDetail.bottomAnchor, constant: 10.0),
            lblActors.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            lblActors.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            lblActors.heightAnchor.constraint(equalToConstant: 20)
            ])
        lblDirector.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            lblDirector.topAnchor.constraint(equalTo: lblActors.bottomAnchor, constant: 10.0),
            lblDirector.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            lblDirector.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            lblDirector.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
}
