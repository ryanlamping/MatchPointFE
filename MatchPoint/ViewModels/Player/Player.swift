//
//  Player.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 11/8/24.
//

import Foundation

class PlayerViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var nationality: String = ""
    @Published var birthdate: String = ""
    @Published var hand: String = ""
    @Published var gender: String = ""
    
    private var playerService = PlayerService()
    
    func getPlayer() {
        
    }
    
    
}
