//
//  Repository.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

protocol PostsRepository {
    func fetchPosts(skip: Int, limit: Int) -> AnyPublisher<[Post], Error>
    func searchPosts(_ query: String, skip: Int, limit: Int) -> AnyPublisher<[Post], Error>
    func savePost(_ post: Post) -> AnyPublisher<LocalPost, Error>
}
