//
//  LoginUseCase.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

class LoginUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func execute(_ request: LoginRequest) -> AnyPublisher<Login, Error> {
        return Future { promise in
            do {
                try request.validate()
                self.repository.login(username: request.username, password: request.password)
                    .sink {
                        if case let .failure(error) = $0 {
                            promise(.failure(error))
                        }
                    } receiveValue: {
                        promise(.success($0))
                    }.store(in: &self.cancellables)
            } catch { promise(.failure(error)) }
        }.eraseToAnyPublisher()
    }
}
