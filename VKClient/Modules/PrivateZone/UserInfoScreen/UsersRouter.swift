//
//  UsersRouter.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 27.08.2022.
//

import Foundation

protocol UserRouter {
    func goToDetails(model: UserModel)
}

extension FriendsCoordinator: UserRouter {
    func goToDetails(model: UserModel) {
        self.route(to: \.detailsInfo, model)
    }
}
