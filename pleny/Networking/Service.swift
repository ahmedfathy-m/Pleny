//
//  Service.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

class Webservice {
    private init() {}
    static let main = Webservice()
    private var cancellables = Set<AnyCancellable>()
    
    func makeRequest<T: Codable>(route: Route, model: T.Type) -> AnyPublisher<T, Error> {
        let request = route.asURLRequest()
        return Future { promise in
            URLSession.shared.dataTaskPublisher(for: request)
                .retry(2)
                .tryMap {
                    if let statusCode = ($0.response as? HTTPURLResponse)?.statusCode {
                        if statusCode < 400 {
                            return $0.data
                        } else if (400...499).contains(statusCode) {
                            let apiError = try JSONDecoder().decode(APIError.self, from: $0.data)
                            throw apiError
                        } else {
                            throw URLError(.badServerResponse)
                        }
                    } else {
                        throw URLError(.notConnectedToInternet)
                    }
                }.decode(type: model.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    if case .failure(let error) = completion {
                        promise(.failure(error))
                    }
                } receiveValue: { model in
                    promise(.success(model))
                }.store(in: &self.cancellables)
        }.eraseToAnyPublisher()
    }
}
