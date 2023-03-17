//
//  PostsDatasourceInterface.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

protocol PostsLocalDatasource {
    func savePost(post: Post) -> AnyPublisher<LocalPost, Error>
}

protocol PostsRemoteDatasource {
    func fetchPosts(skip: Int, limit: Int) -> AnyPublisher<[Post], Error>
    func searchPosts(query: String, skip: Int, limit: Int) -> AnyPublisher<[Post], Error>
}
