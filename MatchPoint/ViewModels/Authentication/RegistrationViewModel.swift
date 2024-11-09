//
//  RegistrationViewModel.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 6/19/24.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var birthday: String = ""
    @Published var nationality: String = ""
    @Published var signupStatus: String = ""
    
    private var signupService = SignUpService()
    
    func signUp() {
        signupService.signup(name: name, email: email, password: password, birthday: birthday, nationality: nationality) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.signupStatus = "Welcome!"
                case .failure:
                    self?.signupStatus = "Signup failed. Please try again."
                }
            }
        }
    }
}
