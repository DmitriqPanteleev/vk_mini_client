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
                    isOnline: isOnlineCast(serverEntity.online),
                    trackCode: serverEntity.trackCode ?? "",
                    photoMin: serverEntity.photoMin ?? "",
                    firstName: serverEntity.firstName ?? "",
                    lastName: serverEntity.lastName ?? "",
                    canAccessClosed: serverEntity.canAccessClosed ?? false,
                    isClosed: serverEntity.isClosed ?? false)
    }
}

private extension FriendModelMapper {
    func isOnlineCast(_ serverIsOnline: Int?) -> Bool {
        if (serverIsOnline == nil) {
            return true
        }
        
        switch (serverIsOnline) {
        case 0: return false
        case 1: return true
        default: return true
        }
    }
}
