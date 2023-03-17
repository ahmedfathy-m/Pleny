//
//  ValidationErros.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

enum ValidationError: Error {
    case usernameTooShort
    case usernameEmpty
    case passwordTooShort
    case passwordEmpty
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .usernameTooShort:
            return "Username is too short."
        case .usernameEmpty:
            return "Username can't be empty."
        case .passwordTooShort:
            return "Password is too short."
        case .passwordEmpty:
            return "Password can't be empty."
        }
    }
}
