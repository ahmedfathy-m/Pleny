//
//  SearchPostsUseCase.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

struct SearchPostsUseCase {
    private let repository: PostsRepository
    
    init(repository: PostsRepository) {
        self.repository = repository
    }
    
    func execute(_ request: SearchPostsRequest) -> AnyPublisher<[Post], Error> {
        repository.searchPosts(request.query, skip: request.skip, limit: request.limit)
    }
}
