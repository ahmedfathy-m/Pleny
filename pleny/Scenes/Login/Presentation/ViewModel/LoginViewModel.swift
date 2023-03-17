//
//  LoginViewModel.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    private unowned let coordinator: CoordinatorObject!
    
    init(coordinator: CoordinatorObject, loginUseCase: LoginUseCase) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
    }
    
    // MARK: - Credentials
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isSecure: Bool = true
    
    // MARK: - Errors
    @Published var didFinishWithError: Bool = false
    @Published var errorDescription: String = ""
    
    // MARK: - Validation
    @Published var isEntriesValid: Bool = false
    @Published var didLoginSuccessfully: Bool = false
    
    // MARK: - Subscriptions
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Use Cases
    private let loginUseCase: LoginUseCase
    
    func validateEntries() {
        guard username.count > 5 else {
            didFinishWithError = true
            errorDescription = "Username should be longer than 5 characters."
            isEntriesValid = false
            return
        }
        
        guard password.count > 5 else {
            didFinishWithError = true
            errorDescription = "Password should be at least 6 characters."
            isEntriesValid = false
            return
        }
        
        isEntriesValid = true
    }
    
    func login() {
        let request = LoginRequest(username: username, password: password)
        loginUseCase.execute(request)
            .sink {
                if case .failure(let error) = $0 {
                    self.didFinishWithError = true
                    self.errorDescription = error.localizedDescription
                }
            } receiveValue: { _ in
                self.didLoginSuccessfully = true
                self.coordinator.switchToHome()
            }.store(in: &cancellables)
    }
}
