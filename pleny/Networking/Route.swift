//
//  Route.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

protocol Route {
    var domain: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var query: HTTPQueryParamters {get}
    var bodyParameters: HTTPBodyParameters? {get}
    var encoding: HTTPBodyEncoding? {get}
}


typealias HTTPQueryParamters = [String: String]

extension Route {
    func asURLRequest() -> URLRequest {
        guard let url = URL(string: "\(domain)/\(path)") else {
            fatalError("\(domain)/\(path) is not a valid URL")
        }
        var request = URLRequest(url: url)
        request.queryItems = self.query
        request.httpMethod = self.method.rawValue
        if let encoding {
            request.setValue(encoding.rawValue, forHTTPHeaderField: "Content-Type")
            request.httpBody = self.bodyParameters?.encodeParamters(as: encoding)
        }
        return request
    }
}
