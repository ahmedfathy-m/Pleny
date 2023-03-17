//
//  AuthRouter.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

enum AuthRouter {
    case login(username: String, password: String)
}

extension AuthRouter: Route {
    var domain: String { "https://dummyjson.com" }
    
    var path: String {
        switch self {
        case .login: return "auth/login"
        }
    }
    
    var method: HTTPMethod { .post }
    
    var query: HTTPQueryParamters { [:] }
    
    var bodyParameters: HTTPBodyParameters? {
        switch self {
        case .login(let username, let password):
            return ["username": username, "password": password]
        }
    }
    
    var encoding: HTTPBodyEncoding? { return .json }
}
