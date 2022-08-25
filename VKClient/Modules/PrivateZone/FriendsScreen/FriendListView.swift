//
//  FriendListView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import SwiftUI

struct FriendListView: View {
    
    @StateObject var viewModel: FriendListViewModel
    
    var body: some View {
        VStack {
            tableView()
        }
        .onAppear(perform: onApperSend)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Мои друзья")
    }
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }

}

private extension FriendListView {
    func tableView() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.output.friendList) { model in
                FriendCellView(model: model)
                    .onTapGesture {
                        onFriendTapSend(model.id)
                    }
                Divider()
            }
        }
    }
}

private extension FriendListView {
    func onFriendTapSend(_ id: Int) {
        print("model sended")
        viewModel.input.onFriendTap.send(id)
    }
}

//struct FriendListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendListView()
//    }
//}
