//
//  HomeViewController.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/22.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var stack = UIStackView()
    var imgMovie1 = UIImageView()
    var imgMovie2 = UIImageView()
    var imgMovie3 = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = UIView()
        view.backgroundColor = .white
        
        let imageSample:UIImage = UIImage(named:"sample")! //poster_url
        imgMovie1 = UIImageView(image:imageSample)
//        let screenWidth:CGFloat = view.frame.size.width
//        let screenHeight:CGFloat = view.frame.size.height
//        let imgWidth:CGFloat = imgMovie1.image!.size.width
//        let imgHeight:CGFloat = imgMovie1.image!.size.height
//        let scale:CGFloat = screenWidth / imgWidth
//        let rect:CGRect =
//            CGRect(x:0, y:0, width:imgWidth*scale, height:imgHeight*scale)
//        imgMovie1.frame = rect
//        imgMovie1.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        imgMovie1.isUserInteractionEnabled = true
        imgMovie1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeViewController.imageViewTapped(_:))))
        
        //for test
        let imageSample2:UIImage = UIImage(named:"sample2")! //poster_url
        imgMovie2 = UIImageView(image:imageSample2)
        
        //for test
        let imageSample3:UIImage = UIImage(named:"sample3")! //poster_url
        imgMovie3 = UIImageView(image:imageSample3)
        
        
        
        stack.spacing = 10
        stack.backgroundColor = UIColor.cyan
        view.addSubview(stack)
        
        stack.addArrangedSubview(imgMovie1)
        stack.addArrangedSubview(imgMovie2)
        stack.addArrangedSubview(imgMovie3)
        
        loadConstraints()
    }
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        
        
        
        
        
        let nextvc = DetailViewController()
        
        nextvc.selectedURL = "https://directflix.vnz.la/titles/search?q=marvel"
        self.navigationController?.pushViewController(nextvc, animated: false)
        //self.present(nextvc, animated: true, completion: nil)
    }
    
    func loadConstraints() {
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50.0).isActive = true
        
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
