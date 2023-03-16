//
//  LoginModel.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import Foundation

struct Login: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}
