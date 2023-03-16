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
    @Published var filteredPosts: [Post] = []
    @Published var search: String = ""
    @Published var isSearching: Bool = false
    
    // MARK: - Error State
    @Published var didFinishWithError = false
    @Published var errorDescription = ""
    
    // MARK: - AnyCancellable
    private var store = Set<AnyCancellable>()
     
    // MARK: - Coordinator
    private unowned let coordinator: CoordinatorObject
    
    init(coordinator: CoordinatorObject) {
        self.coordinator = coordinator
    }
    
    // MARK: - API Call
    func reloadData() {
        self.posts = []
        fetchPosts()
    }
    
    func fetchPosts() {
        var url = "https://dummyjson.com/posts"
        if !search.isEmpty  {
            url = "https://dummyjson.com/posts/search?q=\(search)&limit=10&skip=\(self.posts.count)"
        } else {
            url = "https://dummyjson.com/posts?limit=10&skip=\(self.posts.count)"
        }
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTaskPublisher(for: request)
            .retry(1)
            .map(\.data)
            .decode(type: Timeline.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.didFinishWithError = true
                    self.errorDescription = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: {
                self.posts.append(contentsOf: $0.posts)
                print($0.posts.map(\.id))
            }.store(in: &store)
    }
    
}
