//
//  FriendCellView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import SwiftUI

struct FriendCellView: View {
    let model: FriendModel
    
    var body: some View {
        HStack {
            Text(model.fullName)
                .bold()
            Spacer()
            isOnline(model.isOnline)
        }
        .padding(.horizontal, 16)
    }
}

private extension FriendCellView {
    @ViewBuilder func isOnline(_ onlineState: Bool) -> some View {
        if (onlineState) {
            Image(systemName: "iphone.homebutton.circle.fill")
                .foregroundColor(.blue)
        } else {
            Image(systemName: "iphone.homebutton.circle")
        }
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView(model: FriendModel(id: 1,
                                          isOnline: false,
                                          trackCode: "2r4r453",
                                          firstName: "Dmitriy",
                                          lastName: "Panteleev",
                                          canAccessClosed: true,
                                          isClosed: false))
    }
}
