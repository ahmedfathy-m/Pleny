//
//  URLRequest+Query.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

extension URLRequest {
    /// Assign the query parameters directly, without needing to access the URL
    var queryItems: HTTPQueryParamters {
        get {
            guard let items = URLComponents(string: self.url?.absoluteString ?? "")?.queryItems else { return [:] }
            var query = [String: String]()
            items.forEach { item in
                guard let value = item.value else { return }
                query[item.name] = value
            }
            return query
        }
        
        set {
            let items = newValue.map({URLQueryItem(name: $0.key, value: $0.value)})
            guard var url = URLComponents(string: self.url?.absoluteString ?? "") else { return }
            url.queryItems = items
            self.url = url.url
        }
    }
}
