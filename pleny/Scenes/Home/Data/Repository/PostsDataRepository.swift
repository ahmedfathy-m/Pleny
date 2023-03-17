//
//  PostsDataRepository.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

struct PostsDataRepository: PostsRepository {
    private let remoteDataSource: PostsRemoteDatasource
    private let localDataSource: PostsLocalDatasource
    
    init(remoteDataSource: PostsRemoteDatasource, localDataSource: PostsLocalDatasource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func fetchPosts(skip: Int, limit: Int) -> AnyPublisher<[Post], Error> {
        remoteDataSource.fetchPosts(skip: skip, limit: limit)
    }
    
    func searchPosts(_ query: String, skip: Int, limit: Int) -> AnyPublisher<[Post], Error> {
        remoteDataSource.searchPosts(query: query, skip: skip, limit: limit)
    }
    
    func savePost(_ post: Post) -> AnyPublisher<LocalPost, Error> {
        localDataSource.savePost(post: post)
    }
}
