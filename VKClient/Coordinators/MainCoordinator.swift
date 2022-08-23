//
//  MainCoordinator.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
    
    let authStatus = AuthLocalService.shared.status
    
    // override stack's variable to conform to protocol
    var stack: NavigationStack<MainCoordinator>
    
    @Root var auth = makeAuth
    @Root var general = makeTabBar
    
    init() {
        if authStatus.value {
            stack = NavigationStack(initial: \MainCoordinator.general)
        } else {
            stack = NavigationStack(initial: \MainCoordinator.auth)
        }
    }
    
    @ViewBuilder func customize(_ view: AnyView) -> some View {
        view
            .onReceive(authStatus) { status in
                if status {
                    self.root(\.general)
                } else {
                    self.root(\.auth)
                }
            }
    }
}

extension MainCoordinator {
    // makes auth's coordinator
    func makeAuth() -> NavigationViewCoordinator<AuthCoordinator> {
        let coordinator = AuthCoordinator()
        let stack = NavigationViewCoordinator(coordinator)
        return stack
    }
    
    // makes tabbar's coordinator
    func makeTabBar() -> TabBarCoordinator {
        TabBarCoordinator()
    }
}
