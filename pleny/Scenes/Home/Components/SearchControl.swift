//
//  SearchControl.swift
//  pleny
//
//  Created by Ahmed Fathy on 16/03/2023.
//

import SwiftUI

struct SearchControl: View {
    @Binding var isSearching: Bool
    @Binding var search: String
    var onChange: ()->Void
    var onCancel: ()->Void
    var body: some View {
        HStack {
            if isSearching {
                HStack {
                    Image("mini-search")
                        .resizable()
                        .frame(width: 12.5, height: 12.5, alignment: .center)
                        .padding(.leading, 11.25)
                    TextField("Search...", text: $search)
                        .onChange(of: search) { newVal_ue in
                            self.onChange()
                        }
                    Button {
                        isSearching = false
                        if !search.isEmpty {
                            search = ""
                            self.onCancel()
                        }
                    } label: {
                        Image("close-circle")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                    }.padding(.trailing, 7.5)
                }.overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color("BorderColor"))
                }.frame(width: UIScreen.main.bounds.width - 40, height: 35)
            } else {
                Button {
                    withAnimation(.linear) {
                        isSearching = true
                    }
                } label: {
                    Image("Search")
                }
            }
        }
        .transition(.opacity)
//        .animation(.linear ,value: isSearching)
    }
}
