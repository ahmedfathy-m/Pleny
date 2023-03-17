//
//  LoginView.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import SwiftUI

struct LoginView: View {
    // MARK: - View Model
    @StateObject var viewModel: LoginViewModel
    
    // MARK: - Body
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 24) {
                // MARK: - Header
                Image("loginHeader")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: proxy.size.width)
                Text("Welcome")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("MainColor"))
                // MARK: - Fields
                UsernameField(username: $viewModel.username)
                PasswordField(password: $viewModel.password, isSecure: $viewModel.isSecure)
                
                Spacer().frame(height: 16)
                
                // MARK: - Login Button
                LoginButton {
                    viewModel.validateEntries()
                    viewModel.login()
                }

            }.ignoresSafeArea(edges: .top)
                .alert(viewModel.errorDescription, isPresented: $viewModel.didFinishWithError) {
                    Button("Dismiss") {
                        viewModel.didFinishWithError = false
                        viewModel.errorDescription = ""
                    }
                }
        }
    }
}
