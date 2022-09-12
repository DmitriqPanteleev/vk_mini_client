//
//  FriendInviteButton.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 26.08.2022.
//

import SwiftUI

struct FriendInviteButton: View {
    @Environment (\.isEnabled) private var isEnabled
    
    let style: FriendInviteButtonStyle
    
    var body: some View {
        HStack {
            Spacer()
            style.icon
            Text(style.title)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(style.textColor)
            Spacer()
        }
        .padding(.vertical, 10)
        .background(style.background)
        .cornerRadius(15)
        .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: style.stroke)
            )
    }
}

//struct FriendInviteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendInviteButton()
//    }
//}
