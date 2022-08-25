//
//  GroupRouter.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 21.08.2022.
//

import Foundation

protocol GroupsRouter: AnyObject {
    func goToInfo(model: GroupModel)
}

extension GroupsCoordinator: GroupsRouter {
    
    func goToInfo(model: GroupModel) {
        self.route(to: \.groupInfo, model)
    }
    
}
