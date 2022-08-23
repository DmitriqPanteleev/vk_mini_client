//
//  TabBarCoordinator.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import SwiftUI
import Stinsen
import Combine

final class TabBarCoordinator: TabCoordinatable {
    
    var child = TabChild(
        startingItems: [
            \TabBarCoordinator.friends,
            \TabBarCoordinator.groups,
            \TabBarCoordinator.albums,
        ]
    )
    
    @Route(tabItem: makeFriendsTab) var friends = makeFriends
    @Route(tabItem: makeGroupsTab) var groups = makeGroups
    @Route(tabItem: makeAlbumsTab) var albums = makeAlbums
    
    
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

private extension TabBarCoordinator {
    
    func customize() {}
    
    @ViewBuilder func makeFriends() -> some View {
        FriendListView()
    }
    
    @ViewBuilder func makeFriendsTab(isActive: Bool) -> some View {
        VStack {
            Image(systemName: "person.2.fill")
            Text("Друзья")
        }
    }
    
    
//    @ViewBuilder func makeGroups() -> some View {
//        GroupListView()
//    }
    
    func makeGroups() -> NavigationViewCoordinator<GroupsCoordinator> {
        NavigationViewCoordinator(GroupsCoordinator())
    }
    
    @ViewBuilder func makeGroupsTab(isActive: Bool) -> some View {
        VStack {
            Image(systemName: "person.3.fill")
            Text("Группы")
        }
    }

    @ViewBuilder func makeAlbums() -> some View {
        AlbumListView()
    }
    
    @ViewBuilder func makeAlbumsTab(isActive: Bool) -> some View {
        VStack {
            Image(systemName: "person.crop.rectangle.stack.fill")
            Text("Альбомы")
        }
    }
}
