//
//  PostLocalDatasource.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import Combine

struct PostsLocalStore: PostsLocalDatasource {
    let viewContext = PersistenceController.shared.container.viewContext
    
    func savePost(post: Post) -> AnyPublisher<LocalPost, Error> {
        let newLocalPost = LocalPost(context: viewContext)
        newLocalPost.id = Int32(post.id)
        newLocalPost.title = post.title
        newLocalPost.body = post.body
        
        return Future { promise in
            do {
                try viewContext.save()
                promise(.success(newLocalPost))
            } catch {
                viewContext.reset() // Removes the conflicting newly add item (In case of using a non-unique ID. Aka, saving an already saved post)
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
