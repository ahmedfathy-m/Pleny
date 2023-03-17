//
//  HomeRouter.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

enum HomeRouter {
    case posts(skip: Int = 0, limit: Int = 10)
    case search(query: String, skip: Int = 0, limit: Int = 10)
}

extension HomeRouter: Route {
    var domain: String { "https://dummyjson.com" }
    
    var path: String {
        switch self {
        case .posts: return "posts"
        case .search: return "posts/search"
        }
    }
    
    var method: HTTPMethod { .get }
    
    var query: HTTPQueryParamters {
        switch self {
        case .posts(let skip, let limit): return ["limit": "\(limit)", "skip": "\(skip)"]
        case .search(let query, let skip, let limit): return ["q": query, "limit": "\(limit)", "skip": "\(skip)"]
        }
    }
    
    var bodyParameters: HTTPBodyParameters? { return nil }
    
    var encoding: HTTPBodyEncoding? { return nil }
}
