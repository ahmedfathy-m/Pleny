//
//  LoginButton.swift
//  pleny
//
//  Created by Ahmed Fathy on 16/03/2023.
//

import SwiftUI

struct LoginButton: View {
    var didPress: ()->Void
    var body: some View {
        Button {
            didPress()
        } label: {
            ZStack {
                Capsule(style: .circular)
                    .foregroundColor(Color("MainColor"))
                Text("Sign In")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
            }
        }.frame(height: 46)
         .padding(.horizontal, 16)
    }
}
