//
//  PostRemoteDatasource.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

struct PostsRemoteStore: PostsRemoteDatasource {
    func fetchPosts(skip: Int, limit: Int) -> AnyPublisher<[Post], Error> {
        let response = Webservice.main.makeRequest(route: HomeRouter.posts(skip: skip, limit: limit), model: Timeline.self)
        return response.map(\.posts).eraseToAnyPublisher()
    }
    
    func searchPosts(query: String, skip: Int, limit: Int) -> AnyPublisher<[Post], Error> {
        let response = Webservice.main.makeRequest(route: HomeRouter.search(query: query), model: Timeline.self)
        return response.map(\.posts).eraseToAnyPublisher()
    }
}
