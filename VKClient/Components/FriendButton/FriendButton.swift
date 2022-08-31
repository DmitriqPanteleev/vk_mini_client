//
//  FriendButton.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 26.08.2022.
//

import SwiftUI

struct FriendButton: View {
    let model: FriendModel
    
    var body: some View {
        VStack(alignment: .center) {
            NetworkImage(imageURL: URL(string: model.photoMin))
            Text("\(model.firstName)\n\(model.lastName)")
                .font(.caption)
        }
        .frame(alignment: .center)
    }
}

//struct FriendButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendButton()
//    }
//}
