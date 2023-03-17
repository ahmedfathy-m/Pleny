//
//  GradientTitleView.swift
//  pleny
//
//  Created by Ahmed Fathy on 16/03/2023.
//

import SwiftUI

struct GradientTitleView: View {
    private var title: String
    var body: some View {
        Text(title)
            .font(.custom("Avenir", fixedSize: 22))
            .fontWeight(.black)
            .foregroundStyle(.linearGradient(colors: [Color("Gradient#1"), Color("Gradient#2")], startPoint: .bottomTrailing, endPoint: .topLeading))
    }
    
    init(_ title: String) {
        self.title = title
    }
}
