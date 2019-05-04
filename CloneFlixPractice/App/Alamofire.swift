//
//  Alamofire.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/25.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit
import Alamofire

enum directFlix: String {
    case select = "https://directflix.vnz.la/titles/"
    case search = "https://directflix.vnz.la/titles/search?q="
    case tvshow = "https://directflix.vnz.la/titles/tv-shows"
    case movie = "https://directflix.vnz.la/titles/movies"
    case recentlyAdded = "https://directflix.vnz.la/titles/recently-added"
    case trendingNow = "https://directflix.vnz.la/titles/trending-now"
}


struct SearchMovie: Codable {
    
    var id: String
    //    let added_at: String?
    //    let trending_at: String?
    var title: String
    let poster_url: String?
    //    let source_url: String?
    //    let title_type: String?
    //    let production_year: Int?
    let series_years: String?
    //    let languages: String?
    //    let duration: String?
    //    let country: String?
    var plot: String
    //    let genres: String?
    let director: String
    //    let writer: String?
    let actors: String
    //    let rating: Int?
    //    let created_at: String?
    //    let updated_at: String?
    
}

struct searchMovieUIImage {
    
    var model: SearchMovie
    var image: UIImage?
}


