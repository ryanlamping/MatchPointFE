//
//  AuthenticationView.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 6/19/24.
//
// could we add a guest view here so people can just view scores if desired?

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationView {
            // can we add a fade in/left slide in transition here?
            VStack {
                Text("Welcome to")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Image("match-point-high-resolution-logo-transparent")
                    .resizable()
                    .frame(height: 150)
                    .frame(width: 250)
                    .padding(.bottom, 30)
                
                HStack{
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .font(.system(size: 24))
                            .frame(minWidth: 100)
                            .padding()
                            .background(Color(hex: "#E1E587"))
                            .foregroundColor(Color(hex: "1E421D"))
                            .cornerRadius(5.0)
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .font(.system(size: 24))
                            .frame(minWidth: 100)
                            .padding()
                            .background(Color(hex: "#E1E587"))
                            .foregroundColor(Color(hex: "1E421D"))
                            .cornerRadius(5.0)
                    }
                }
            }
            .applyBackground()
        }
    }
}

#Preview {
    AuthenticationView()
}
