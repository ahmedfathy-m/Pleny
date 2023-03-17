//
//  PostView.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import SwiftUI

struct PostView: View {
    @State var isSearching: Bool
var searchText: String
    var post: Post
    var header = Header.allHeaders[Int.random(in: 0..<Header.allHeaders.count)]
    let postImages = ["image-1", "image-2", "image-3", "image-4", "image-5", "image-6", "image-7", "image-8"]
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(header.image)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .leading)
                    .clipShape(Circle())
                VStack (alignment: .leading) {
                    Text(header.name)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                    Text(header.time)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
            }
            Group {
                Text(LocalizedStringKey(post.body))
                    .font(.system(size: 17))
                    .foregroundColor(Color("MainFont"))
            }
            ImageGrid(images: Array(postImages.shuffled().prefix(Int.random(in: 1..<postImages.count))))
                .aspectRatio(1, contentMode: .fit)
        }.padding(.top, 10)
    }
}
