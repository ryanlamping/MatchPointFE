//
//  LoginService.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 7/1/24.
//

import Foundation

class LoginService {
    // Defining api route for login
    let apiURL = URL(string: "http://localhost:8000/auth/token/")!

    // takes in user inputted username, password and gracefully handles all situations
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Create URL request
        var request = URLRequest(url: apiURL)
        
        // Specify http method (posting)
        request.httpMethod = "POST"
        // sending through form data, not json
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Create url-encoded body with user inputs
        let jsonBody: [String: String] = ["email": email.lowercased(), "password": password]
        
        print("Sending request with body: \(jsonBody)")
        
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: jsonBody, options: .prettyPrinted)
            } catch {
                completion(.failure(error))
                return
            }
        
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
            if let httpResponse = response as? HTTPURLResponse {
                print("Response status code: \(httpResponse.statusCode)")
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
