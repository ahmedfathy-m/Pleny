//
//  FetchPostsUseCase.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

struct FetchPostsUseCase {
    private let repository: PostsRepository
    
    init(repository: PostsRepository) {
        self.repository = repository
    }
    
    func execute(_ request: FetchPostsRequest) -> AnyPublisher<[Post], Error> {
        repository.fetchPosts(skip: request.skip, limit: request.limit)
    }
}
