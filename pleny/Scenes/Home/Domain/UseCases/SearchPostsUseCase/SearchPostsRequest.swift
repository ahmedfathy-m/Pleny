//
//  SearchPostsRequest.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

struct SearchPostsRequest {
    let query: String
    let skip: Int
    let limit: Int
    
    init(query: String, skip: Int = 0, limit: Int = 10) {
        self.query = query
        self.skip = skip
        self.limit = limit
    }
}
