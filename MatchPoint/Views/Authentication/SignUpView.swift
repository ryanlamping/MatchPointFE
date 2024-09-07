//
//  SignUpView.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 6/16/24.
//
// frontend data validation to ensure @ in email, passwords match, and at least a character for each field

import SwiftUI

struct SignUpView: View {
    // Creating the registration viewModel
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            // Heading
            Text("Welcome to Match Point!")
                .font(.title)
                .foregroundColor(Color(hex: "E1E587"))
                .padding(.bottom, 20)
            
            // Iterate through ENUM of registration fields
            ForEach(RegistrationField.allCases, id: \.self) { field in
                HStack {
                    Text(field.rawValue)
                        .font(.headline)
                        .foregroundColor(Color(hex: "E1E587"))
                        .frame(width: 120, alignment: .leading)
                    
                    switch field {
                    case .firstName:
                        TextField("Enter \(field.rawValue)", text: $viewModel.firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    case .lastName:
                        TextField("Enter \(field.rawValue)", text: $viewModel.lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    case .email:
                        TextField("Enter \(field.rawValue)", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                    case .password:
                        SecureField("Enter \(field.rawValue)", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    case .confirmPassword:
                        SecureField("Enter \(field.rawValue)", text: $viewModel.confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                .padding(.vertical, 5)
            }
            
            Button(action: {
                // Call backend api to register user into database
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding()
        .applyBackground()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

