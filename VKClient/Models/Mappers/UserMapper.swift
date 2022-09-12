//
//  UserMapper.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation

final class UserMapper: BaseModelMapper<UserServerModel, UserModel> {
    override func toLocal(serverEntity: UserServerModel) -> UserModel {
        UserModel(id: serverEntity.id,
                  bdate: serverEntity.bdate.orEmpty,
                  domain: serverEntity.domain.orEmpty,
                  city: serverEntity.city?.title ?? "",
                  isFriend: TypesCast.intToBool(serverEntity.isFriend ?? -1),
                  photoMaxOrig: serverEntity.photoMaxOrig!,
                  status: serverEntity.status.orEmpty,
                  lastSeen: TypesCast.unixDateToTimeString(serverEntity.lastSeen?.time ?? 0),
                  followersCount: serverEntity.followersCount ?? -1,
                  commonCount: serverEntity.commonCount ?? -1,
                  counters: serverEntity.counters ?? [:],
                  online: TypesCast.intToBool(serverEntity.online),
                  firstName: serverEntity.firstName,
                  lastName: serverEntity.lastName,
                  canAccessClosed: serverEntity.canAccessClosed,
                  isClosed: serverEntity.isClosed)
    }
}
