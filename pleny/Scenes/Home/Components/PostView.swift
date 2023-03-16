//
//  PostView.swift
//  pleny
//
//  Created by Ahmed Fathy on 15/03/2023.
//

import SwiftUI

struct PostView: View {
    var post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image("profile")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .leading)
                    .clipShape(Circle())
                VStack (alignment: .leading) {
                    Text("Ahmed Fathy")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                    Text("12:00 PM")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
            }
            Text(post.body)
                .font(.system(size: 17))
                .foregroundColor(Color("MainFont"))
            ImageGrid(images: ["", "",""])
                .aspectRatio(1, contentMode: .fit)
        }.padding(.top, 10)
    }
}

struct PostViewPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .empty)
    }
}
