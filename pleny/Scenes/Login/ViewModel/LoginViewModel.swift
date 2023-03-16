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
    
    init(coordinator: CoordinatorObject) {
        self.coordinator = coordinator
    }
    
    // MARK: - Credentials
    @Published var username: String = "kminchelle"
    @Published var password: String = "0lelplR"
    @Published var isSecure: Bool = true
    
    // MARK: - Errors
    @Published var didFinishWithError: Bool = false
    @Published var errorDescription: String = ""
    
    // MARK: - Validation
    @Published var isEntriesValid: Bool = false
    @Published var didLoginSuccessfully: Bool = false
    
    // MARK: - Subscriptions
    private var store = Set<AnyCancellable>()
    
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
        guard isEntriesValid else { return }
        guard let url = URL(string: "https://dummyjson.com/auth/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: ["username": self.username, "password": self.password])
        URLSession.shared.dataTaskPublisher(for: request)
            .retry(1)
            .map(\.data)
            .decode(type: Login.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.didFinishWithError = true
                    self.errorDescription = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { login in
                self.didLoginSuccessfully = true
                self.coordinator.switchToHome()
            }.store(in: &store)
    }
}
