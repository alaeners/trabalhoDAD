//
//  MovieRequest.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

struct MovieRequest: Codable {
    
    let apiKey = "1f54bd990f1cdfb230adb312546d765d"
    var apiPage:Int
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case apiPage = "page"
    }
}
