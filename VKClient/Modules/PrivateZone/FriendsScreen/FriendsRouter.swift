//
//  FriendsRouter.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation

protocol FriendsRouter {
    func goToInfo(id: Int)
}

extension FriendsCoordinator: FriendsRouter {
    func goToInfo(id: Int) {
        self.route(to: \.friendInfo, id)
    }
}
