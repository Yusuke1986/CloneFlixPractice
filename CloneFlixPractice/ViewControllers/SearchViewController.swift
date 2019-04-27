//
//  SearchViewController.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/22.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

        var searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .darkGray
        
        //searchBar = UISearchBar(frame:CGRect(x:0.0,y:100.0,width:self.view.bounds.size.width,height:44.0))
        //searchBar.delegate = self
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
    
    
}
