//
//  FriendListView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import SwiftUI

struct FriendListView: View {
    
    @StateObject private var viewModel = FriendListViewModel()
    
    var body: some View {
        VStack {
            Text("My Friends")
                .onAppear(perform: onApperSend)
            tableView()
            // TODO: GestureMask to write
        }
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
                Divider()
            }
        }
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
