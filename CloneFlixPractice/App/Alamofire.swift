//
//  Alamofire.swift
//  CloneFlixPractice
//
//  Created by 松岡裕介 on 2019/04/25.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit
import Alamofire

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
