//
//  GroupsCoordinator.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 21.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class GroupsCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \GroupsCoordinator.start)
    
    @Root var start = makeStart
    @Route(.push) var groupInfo = makeGroupInfo
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension GroupsCoordinator {
    
    @ViewBuilder func makeStart() -> some View {
        let viewModel = GroupListViewModel(router: self)
        GroupListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makeGroupInfo(model: GroupModel) -> some View {
        GroupInfoView(model: model)
    }
}
