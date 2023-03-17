//
//  FetchPostsRequest.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

struct FetchPostsRequest {
    let skip: Int
    let limit: Int
    
    init(skip: Int = 0, limit: Int = 10) {
        self.skip = skip
        self.limit = limit
    }
}
