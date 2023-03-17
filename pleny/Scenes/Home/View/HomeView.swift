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
                PostView(post: post)
                    .contextMenu {
                        Button {
                            print("Save Post")
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.down")
                                Text("Save Post")
                            }
                        }
                    }
                    .onAppear {
                        if viewModel.posts.firstIndex(where: {$0.id == post.id}) == viewModel.posts.count - 1 {
                            viewModel.fetchPosts()
                        }
                    }
            }
        }.listStyle(.plain)
        .onAppear {
            viewModel.fetchPosts()
        }
        .alert(viewModel.errorDescription, isPresented: $viewModel.didFinishWithError) {
            Button("Okay") {
                viewModel.didFinishWithError = false
                viewModel.errorDescription = ""
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
                        viewModel.reloadData()
                    } onCancel: {
                        viewModel.reloadData()
                    }
                }
            }
    }
}
