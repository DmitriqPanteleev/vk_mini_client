//
//  FrendMapper.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation

final class FriendModelMapper: BaseModelMapper<FriendServerModel, FriendModel> {
    
    override func toLocal(serverEntity: FriendServerModel) -> FriendModel {
        FriendModel(id: serverEntity.id,
                    firstName: serverEntity.firstName,
                    secondName: serverEntity.secondName,
                    isOnline: isOnlineCast(serverEntity.isOnline))
    }
}

private extension FriendModelMapper {
    func isOnlineCast(_ serverIsOnline: Int) -> Bool {
        switch (serverIsOnline) {
        case 0: return false
        case 1: return true
        default:
            // so at least we can see that it doesn't work
            // caz all users'll be online
            return true
        }
    }
}
