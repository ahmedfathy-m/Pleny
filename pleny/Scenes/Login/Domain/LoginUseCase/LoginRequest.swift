//
//  LoginRequest.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

struct LoginRequest {
    let username: String
    let password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func validate() throws {
        if username.isEmpty {
            throw ValidationError.usernameEmpty
        } else if username.count < 6 {
            throw ValidationError.usernameTooShort
        } else if password.isEmpty {
            throw ValidationError.passwordEmpty
        } else if password.count < 6 {
            throw ValidationError.passwordTooShort
        }
    }
}
