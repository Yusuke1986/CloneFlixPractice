//
//  MainTabBarController.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/22.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    var homeNavController: UINavigationController?
    var searchNavController: UINavigationController?
    var detailNavController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewController()
        let searchViewController = SearchViewController()
        let detailViewController = DetailViewController()
        
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        self.homeNavController = homeNavController
        
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        self.searchNavController = searchNavController
        
        let detailNavController = UINavigationController(rootViewController: detailViewController)
        self.detailNavController = detailNavController
        
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), tag: 2)
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "Search"), tag: 3)
        detailViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let controllers = [homeNavController, searchNavController, detailNavController]

        self.setViewControllers(controllers, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
