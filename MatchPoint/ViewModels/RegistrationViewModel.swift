//
//  RegistrationViewModel.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 6/19/24.
//

import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    //private var SignUpService = SignUpService()
    
    func register() {
        // use register service to post data to postgresql
        
//        loginService.login(email: email, password: password) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                    
//                case .success(let user):
//                    self?.loginStatus =  "Welcome, \(user.email)!"
//                    
//                case .failure :
//                    self?.loginStatus = "Login failed. Please try again."
//                }
//            }
//        }
    }
}
