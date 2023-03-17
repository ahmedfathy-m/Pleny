//
//  Timeline.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import Foundation

struct Timeline: Codable {
    let posts: [Post]
    let total, skip, limit: Int
}
