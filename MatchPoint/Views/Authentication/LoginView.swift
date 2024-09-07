//
//  LoginView.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 6/16/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack (alignment: .center){
            Spacer()
            Text("Welcome Back!")
                .font(.title)
                .foregroundColor(Color(hex: "E1E587"))
                .padding()
            Text("Please log in:")
                .font(.system(size: 20))
                .foregroundColor(Color(hex: "E1E587"))
            
            VStack (alignment: .leading, spacing: 10) {
                AuthenticationTextFieldName(name: "Email:")
                TextField("", text: $viewModel.email)
                    .font(.system(size: 15))
                    .frame(height: 44, alignment: .leading)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(4.0)
            }
            VStack (alignment: .leading, spacing: 10) {
                AuthenticationTextFieldName(name: "Password:")
                SecureField("", text: $viewModel.password)
                    .font(.system(size: 15))
                    .frame(height: 44)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(4.0)
            }
            Button(action: {
                viewModel.login()
            }) {
                Text("Login")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Text(viewModel.loginStatus)
                .padding()
                .foregroundColor(Color(hex: "E1E587"))
            Spacer()
        }
        .padding()
        .applyBackground()
    }
}

#Preview {
    LoginView()
}
