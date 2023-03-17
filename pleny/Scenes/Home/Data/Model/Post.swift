//
//  Post.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    var body: String
    let userID: Int
    let tags: [String]
    let reactions: Int

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
    
    static let empty = Post(id: 0, title: "someTitle", body: "body", userID: 0, tags: [], reactions: 0)
}
