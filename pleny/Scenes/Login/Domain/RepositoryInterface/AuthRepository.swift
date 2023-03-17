//
//  AuthRepository.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

protocol AuthRepository {
    func login(username: String, password: String) -> AnyPublisher<Login, Error>
}
