//
//  AuthRemoteStore.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

struct AuthRemoteStore: AuthRemoteDatasource {
    func login(username: String, password: String) -> AnyPublisher<Login, Error> {
        Webservice.main.makeRequest(route: AuthRouter.login(username: username, password: password), model: Login.self)
    }
}
