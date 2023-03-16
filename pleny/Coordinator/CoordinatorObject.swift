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
        loginViewModel = LoginViewModel(coordinator: self)
    }
    
    func switchToHome() {
        didLogin = true
        homeViewModel = HomeViewModel(coordinator: self)
    }
}

enum MainTab {
    case home
    case shop
    case discounts
    case gallery
    case profile
}
