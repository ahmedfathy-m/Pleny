//
//  CoordinatorView.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import SwiftUI

struct CoordinatorView: View {
    @ObservedObject var object: CoordinatorObject = CoordinatorObject()
    var body: some View {
        ZStack {
            if object.didLogin {
                TabView(selection: $object.tab) {
                    // MARK: - Home
                    NavigationView {
                        HomeView(viewModel: object.homeViewModel!)
                    }.tabItem {
                        Image("home").renderingMode(.template)
                    }.tag(MainTab.home)
                    
                    // MARK: - Shop
                    VStack {
                        Text("Shop")
                    }.tabItem {
                        Image("shop").renderingMode(.template)
                    }.tag(MainTab.shop)
                    
                    // MARK: - Discounts
                    VStack {
                        Text("Discounts")
                    }.tabItem {
                        Image("discount-shape").renderingMode(.template)
                    }.tag(MainTab.discounts)
                    
                    // MARK: - Gallery
                    VStack {
                        Text("Gallery")
                    }.tabItem {
                        Image("gallery").renderingMode(.template)
                    }.tag(MainTab.gallery)
                    
                    // MARK: - Profile
                    VStack {
                        Text("Profile")
                    }.tabItem {
                        Image("myProfile").renderingMode(.template)
                    }.tag(MainTab.profile)
                }.accentColor(Color("MainColor"))
            } else {
                LoginView(viewModel: object.loginViewModel)
            }
        }.transition(.slide)
            .animation(.linear, value: object.didLogin)
    }
}
