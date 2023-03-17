//
//  ErrorModel.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

struct APIError: Error, Codable, LocalizedError {
    var errorDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case errorDescription = "message"
    }
}
