//
//  SignUpService.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 9/6/24.
//

import Foundation

class SignUpService {
    // Defining api route for sign up
    let apiURL = URL(string: "http://localhost:8000/auth/signup/")!
    
    func signup(name: String, email: String, password: String, birthday: String, nationality: String, completion: @escaping (Result<User, Error>) -> Void) {
            
        // creating http request
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // creating array of strings for request body
        let requestBody: [String: Any] = [
            "name": name,
            "email": email,
            "password": password,
            "birthday": birthday,
            "nationality": nationality,
            "role": "2"
        ]
        
        // json-izing body
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody, options: []) else {
            print("Error: Unable to encode JSON")
            return
        }
        
        // adding body to the request
        request.httpBody = jsonData
        print(jsonData)
        
        // running task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("Error: No data received")
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                   completion(.success(user))
                } catch {
                        completion(.failure(error))
                }
        }
                
        // Start the network request
        task.resume()
    }
}
