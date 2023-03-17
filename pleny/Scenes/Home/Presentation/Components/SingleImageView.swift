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
// MARK: - Placeholder to display offline images
        Image(url)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: width, minHeight: width)
            .clipped()
// MARK: - Uncomment the next code to use it for getting images from URLs
//        AsyncImage(url: URL(string: url)) { image in
//            image
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(minWidth: width)
//                .clipped()
//        } placeholder: {
//            Image(url)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(minWidth: width)
//                .clipped()
//        }

    }
}
