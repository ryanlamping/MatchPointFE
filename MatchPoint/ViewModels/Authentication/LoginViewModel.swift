//
//  LoginViewModel.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 7/3/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginStatus: String = ""
    
    private var loginService = LoginService()
    
    func login() {
        loginService.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let user):
                    // save jwt token
                    self?.loginStatus =  "Welcome, \(user.email)!"
                    
                case .failure :
                    self?.loginStatus = "Login failed. Please try again."
                }
            }
        }
    }
}
