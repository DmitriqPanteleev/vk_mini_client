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
                    isOnline: TypesCast.intToBool(serverEntity.online),
                    trackCode: serverEntity.trackCode ?? "",
                    photoMin: serverEntity.photoMin ?? "",
                    firstName: serverEntity.firstName ?? "",
                    lastName: serverEntity.lastName ?? "",
                    canAccessClosed: serverEntity.canAccessClosed ?? false,
                    isClosed: serverEntity.isClosed ?? false)
    }
}
