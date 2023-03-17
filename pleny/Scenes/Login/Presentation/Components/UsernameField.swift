//
//  UsernameField.swift
//  pleny
//
//  Created by Ahmed Fathy on 16/03/2023.
//

import SwiftUI

struct UsernameField: View {
    @Binding var username: String
    var body: some View {
        VStack (alignment: .leading, spacing: 6) {
            Text("Username")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(Color("MainFont"))
            TextField("Enter your username.", text: $username)
                .font(.system(size: 17, weight: .regular))
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color("BorderColor"))
                }
        }.padding(.horizontal, 16.0)
    }
}
