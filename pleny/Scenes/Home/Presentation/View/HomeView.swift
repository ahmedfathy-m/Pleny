//
//  HomeView.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                PostView(isSearching: viewModel.isSearching, searchText: viewModel.search, post: post)
                    .contextMenu {
                        Button {
                            viewModel.savePost(post)
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.down")
                                Text("Save Post")
                            }
                        }
                    }
                    .onAppear {
                        // Checks for the last cell to call viewModle.fetchPosts() to load the next page.
                        if viewModel.posts.firstIndex(where: {$0.id == post.id}) == viewModel.posts.count - 1 {
                            viewModel.fetchPosts()
                        }
                    }
            }
        } // Posts Table
        .listStyle(.plain)
        .onAppear {
            viewModel.fetchPosts()
        }.alert(viewModel.errorDescription, isPresented: $viewModel.didFinishWithError) {
            Button("Okay") {
                viewModel.didFinishWithError = false
                viewModel.errorDescription = ""
            }
        } // Error Handling
        .alert(viewModel.message, isPresented: $viewModel.shouldDisplayMessage) {
            Button("Okay") {
                viewModel.shouldDisplayMessage = false
                viewModel.message = ""
            }
        }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        if !viewModel.isSearching {
                            GradientTitleView("LOGO")
                        }
                    }.transition(.opacity)
                        .animation(.linear, value: viewModel.isSearching)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    SearchControl(isSearching: $viewModel.isSearching, search: $viewModel.search) {
                        viewModel.searchPosts(reload: true)
                    } onCancel: {
                        viewModel.fetchPosts(reload: true)
                    }
                }
            } // Toolbar
    }
}
