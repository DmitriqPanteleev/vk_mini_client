//
//  FriendInfoView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import SwiftUI

struct FriendInfoView: View {
    
    @StateObject var viewModel: FriendInfoViewModel
    
    var body: some View {
        VStack {
            nameView
        }
        .onAppear(perform: onApperSend)
    }
}

private extension FriendInfoView {
    
    @ViewBuilder var nameView: some View {
        if let model = viewModel.output.friend {
            Text(model.firstName)
        }
    }
    
}

private extension FriendInfoView {
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}

struct FriendInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FriendInfoView(viewModel: FriendInfoViewModel(friendId: 23))
    }
}
