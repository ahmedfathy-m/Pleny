//
//  Headers.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

struct Header {
    let name: String
    let image: String
    let time: String
    
    static let allHeaders: [Header] = [
    Header(name: "Neama Ahmed", image: "header-1", time: "2 days ago"),
    Header(name: "Ahmed Saad", image: "header-2", time: "1 sec ago"),
    Header(name: "KFC", image: "header-3", time: "10 sec ago"),
    ]
}
