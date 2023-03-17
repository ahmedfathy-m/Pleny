//
//  AuthRepositoryObject.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

struct AuthRepositoryObject: AuthRepository {
    private let remote: AuthRemoteDatasource
    
    init(remote: AuthRemoteDatasource) {
        self.remote = remote
    }
    
    func login(username: String, password: String) -> AnyPublisher<Login, Error> {
        remote.login(username: username, password: password)
    }
}
