//
//  RankingService.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 9/28/24.
//

import Foundation

class RankingService {
    let apiURL = URL(string: "http://localhost:8000/auth/rankings/")!
    
    func updateRankings(language: String, completion: @escaping (Result <Ranking, Error>) -> Void) {
        // Create URL request
        var request = URLRequest(url: apiURL)
        
        // Specify http method (posting)
        request.httpMethod = "GET"
        
        
    }
}
