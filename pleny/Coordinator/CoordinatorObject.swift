//
//  CoordinatorObject.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import Foundation

class CoordinatorObject: ObservableObject {
    // MARK: - View Models
    @Published var loginViewModel: LoginViewModel!
    @Published var homeViewModel: HomeViewModel?
    @Published var tab = MainTab.home
    
    // MARK: - States
    @Published var didLogin = false

    init() {
        let remote = AuthRemoteStore()
        let repo = AuthRepositoryObject(remote: remote)
        let loginUseCase = LoginUseCase(repository: repo)
        loginViewModel = LoginViewModel(coordinator: self, loginUseCase: loginUseCase)
    }
    
    func switchToHome() {
        didLogin = true
        let remote = PostsRemoteStore()
        let localStore = PostsLocalStore()
        let repo = PostsDataRepository(remoteDataSource: remote, localDataSource: localStore)
        let fetchPostsUseCase = FetchPostsUseCase(repository: repo)
        let searchPostsUseCase = SearchPostsUseCase(repository: repo)
        let savePostUseCase = SavePostUseCase(repository: repo)
        homeViewModel = HomeViewModel(coordinator: self,
                                      fetchPostsUseCase: fetchPostsUseCase,
                                      searchPostsUseCase: searchPostsUseCase,
                                      savePostUseCase: savePostUseCase)
    }
}

enum MainTab {
    case home
    case shop
    case discounts
    case gallery
    case profile
}
