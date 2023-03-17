//
//  PasswordField.swift
//  pleny
//
//  Created by Ahmed Fathy on 16/03/2023.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    @Binding var isSecure: Bool
    var body: some View {
        VStack (alignment: .leading, spacing: 6) {
            Text("Password")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(Color("MainFont"))
            HStack {
                Group {
                    if isSecure {
                        SecureField("Enter your password.", text: $password)
                    } else {
                        TextField("Enter your password.", text: $password)
                    }
                }.font(.system(size: 17, weight: .regular))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .cornerRadius(8)
                Button {
                    isSecure.toggle()
                } label: {
                    Image("eye")
                }.padding(.trailing, 10)
            }.overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color("BorderColor"))
                }
        }.padding(.horizontal, 16.0)
    }
}
