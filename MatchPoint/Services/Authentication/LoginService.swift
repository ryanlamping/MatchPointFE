//
//  LoginService.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 7/1/24.
//

import Foundation

class LoginService {
    // Defining api route for login
    let apiURL = URL(string: "http://localhost:8000/auth/token")!

    // takes in user inputted username, password and gracefully handles all situations
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Create URL request
        var request = URLRequest(url: apiURL)
        
        // Specify http method (posting)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Create JSON body with user inputs
        let body = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // create task to check login
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                // empty response
                return
            }
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
