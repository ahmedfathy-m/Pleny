//
//  HomeViewModel.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    // MARK: - State
    @Published var posts: [Post] = []
    @Published var search: String = ""
    @Published var isSearching: Bool = false
    
    // MARK: - Error State
    @Published var didFinishWithError = false
    @Published var errorDescription = ""
    
    // MARK: - Message State
    @Published var shouldDisplayMessage = false
    @Published var message = ""
    
    // MARK: - AnyCancellable
    private var cancellables = Set<AnyCancellable>()
     
    // MARK: - Coordinator
    private unowned let coordinator: CoordinatorObject
    
    // MARK: - Use Cases
    private let fetchPostsUseCase: FetchPostsUseCase
    private let searchPostsUseCase: SearchPostsUseCase
    private let savePostUseCase: SavePostUseCase
    
    init(coordinator: CoordinatorObject, fetchPostsUseCase: FetchPostsUseCase, searchPostsUseCase: SearchPostsUseCase, savePostUseCase: SavePostUseCase) {
        self.fetchPostsUseCase = fetchPostsUseCase
        self.searchPostsUseCase = searchPostsUseCase
        self.savePostUseCase = savePostUseCase
        self.coordinator = coordinator
    }
    
    // MARK: - API Call
    func searchPosts(reload: Bool = false) {
        let request = SearchPostsRequest(query: self.search, skip: reload ? 0 : self.posts.count)
        searchPostsUseCase.execute(request)
            .sink {
                if case .failure(let error) = $0 {
                    self.didFinishWithError = true
                    self.errorDescription = error.localizedDescription
                }
            } receiveValue: {
                if reload { self.posts = [] }
                let results = $0.map { post in
                    guard let regex = try? NSRegularExpression(pattern: self.search, options: .caseInsensitive) else { return post}
                    let range = NSRange(location: 0, length: post.body.count)
                    let body = regex.stringByReplacingMatches(in: post.body, options: [], range: range, withTemplate: "**$0**")
                    let newPost = Post(id: post.id, title: post.title, body: body, userID: post.userID, tags: post.tags, reactions: post.reactions)
                    return newPost
                }
                self.posts.append(contentsOf: results)
            }
            .store(in: &cancellables)

    }
    
    func fetchPosts(reload: Bool = false) {
        let request = FetchPostsRequest(skip: reload ? 0 : posts.count)
        fetchPostsUseCase.execute(request)
            .sink {
                if case .failure(let error) = $0 {
                    self.didFinishWithError = true
                    self.errorDescription = error.localizedDescription
                }
            } receiveValue: {
                if reload { self.posts = [] }
                self.posts.append(contentsOf: $0)
            }
            .store(in: &cancellables)
    }
    
    func savePost(_ post: Post) {
        let request = SavePostRequest(post: post)
        savePostUseCase.execute(request)
            .sink {
                if case .failure(let error) = $0 {
                    let error = error as NSError
                    self.didFinishWithError = true
                    self.errorDescription = error.code == 133021 ? "This post is already saved." : error.localizedDescription
                }
            } receiveValue: {
                self.shouldDisplayMessage = true
                self.message = "Successfully Saved Post: \($0.id)"
            }.store(in: &cancellables)

    }
    
}
