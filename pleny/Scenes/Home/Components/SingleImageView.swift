//
//  SingleImageView.swift
//  pleny
//
//  Created by Ahmed Fathy on 16/03/2023.
//

import SwiftUI

struct ImageView: View {
    let url: String
    let width: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: width)
                .clipped()
        } placeholder: {
            Image("loginHeader")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: width)
                .clipped()
        }

    }
}
