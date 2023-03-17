//
//  ImageGridView.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import Foundation
import SwiftUI

struct ImageGrid: View {
    var images: [String]
    var body: some View {
        VStack {
            GeometryReader { proxy in
                HStack (spacing: 5) {
                    VStack (spacing: 5) {
                        if images.count < 4 {
                            ImageView(url: images[0], width: (proxy.size.width - 5.0) / 2.0)
                        } else {
                            ImageView(url: images[0], width: (proxy.size.width - 5.0) / 2.0)
                            ImageView(url: images[2], width: (proxy.size.width - 5.0) / 2.0)
                        }
                    }
                    VStack (spacing: 5) {
                        if images.count == 2 {
                            ImageView(url: images[1], width: (proxy.size.width - 5.0) / 2.0)
                        } else if images.count > 2 && images.count < 4{
                            ImageView(url: images[1], width: (proxy.size.width - 5.0) / 2.0)
                            ImageView(url: images[2], width: (proxy.size.width - 5.0) / 2.0)
                        } else if images.count == 4 {
                            ImageView(url: images[1], width: (proxy.size.width - 5.0) / 2.0)
                            ImageView(url: images[3], width: (proxy.size.width - 5.0) / 2.0)
                        } else if images.count > 4 {
                            ImageView(url: images[1], width: (proxy.size.width - 5.0) / 2.0)
                            ZStack {
                                ImageView(url: images[3], width: (proxy.size.width - 5.0) / 2.0)
                                Rectangle()
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Text("+\(images.count - 4)")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }.aspectRatio(1, contentMode: .fit)
                    .frame(height: proxy.size.width)
                    .clipped()
                    .cornerRadius(5)
            }
        }.padding(.bottom, 10)
        .environment(\.locale, Locale.init(identifier: "en"))
    }
}
