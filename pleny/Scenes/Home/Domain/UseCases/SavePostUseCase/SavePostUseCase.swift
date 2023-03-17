//
//  SavePostUseCase.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

struct SavePostUseCase {
    private let repository: PostsRepository
    
    init(repository: PostsRepository) {
        self.repository = repository
    }
    
    func execute(_ request: SavePostRequest) -> AnyPublisher<LocalPost, Error> {
        repository.savePost(request.post)
    }
}
