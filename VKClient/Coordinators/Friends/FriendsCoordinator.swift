//
//  FriendsCoordinator.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 21.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class FriendsCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \FriendsCoordinator.start)
    
    @Root var start = makeStart
    @Route(.push) var friendInfo = makeFriendInfo
    
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension FriendsCoordinator {
    @ViewBuilder func makeStart() -> some View {
        let viewModel = FriendListViewModel(router: self)
        FriendListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makeFriendInfo(id: Int) -> some View {
        let viewModel = FriendInfoViewModel(friendId: id)
        FriendInfoView(viewModel: viewModel)
    }
}
