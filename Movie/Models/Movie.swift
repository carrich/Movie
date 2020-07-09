//
//  Movie.swift
//  Movie
//
//  Created by Ngoduc on 7/7/20.
//  Copyright © 2020 com.techmaster.D. All rights reserved.
//

import Foundation
// MARK: - Welcome
import SwiftyJSON
class Movies{
    var resultCount: Int
    var results: [Movie]
    init(_ json: JSON) {
        resultCount = json["resultCount"].intValue
        results = json["results"].arrayValue.map{
            Movie($0)
        }
    }
}
class Movie {
    
    var artistName : String
    var trackName: String
    var previewURL: String
    var artworkUrl100: String
    var trackPrice: Double
    var country: String
    var primaryGenreName: String
    
    init(_ json: JSON) {
        
        self.artistName = json["artistName"].stringValue
        
        self.trackName = json["trackName"].stringValue
        
        self.previewURL = json["previewUrl"].stringValue
        
        self.artworkUrl100 = json["artworkUrl100"].stringValue
        
        self.trackPrice = json["trackPrice"].doubleValue
        
        self.country = json["country"].stringValue
        
        self.primaryGenreName = json["primaryGenreName"].stringValue
        
    }
}
