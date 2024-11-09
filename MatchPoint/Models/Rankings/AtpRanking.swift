//
//  AtpRanking.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 9/15/24.
//

import Foundation

struct Competitor: Codable {
    let id: String
    let name: String
    let country: String
    let countryCode: String
    let abbreviation: String
    
    // coding keys to map the json keys to the swift property names defined above
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
        case countryCode
        case abbreviation
    }
}

struct Ranking: Codable {
    let rank: Int
    let movement: Int
    let points: Int
    let competitionsPlayed: Int
    let competitor: Competitor

    // coding keys to map the json keys to the swift property names defined above
    enum CodingKeys: String, CodingKey {
        case rank
        case movement
        case points
        case competitionsPlayed = "competitions_played"
        case competitor
    }
}
