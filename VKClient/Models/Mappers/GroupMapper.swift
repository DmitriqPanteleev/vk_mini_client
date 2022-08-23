//
//  GroupMapper.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import Foundation

final class GroupModelMapper: BaseModelMapper<GroupServerModel, GroupModel> {
    
    override func toLocal(serverEntity: GroupServerModel) -> GroupModel {
        GroupModel(id: serverEntity.id,
                   verified: intToBool(serverEntity.verified ?? 0),
                   desc: serverEntity.desc.orEmpty,
                   subsCount: serverEntity.subsCount ?? 0,
                   activity: serverEntity.activity.orEmpty,
                   status: serverEntity.status.orEmpty,
                   name: serverEntity.name.orEmpty,
                   screenName: serverEntity.screenName.orEmpty,
                   isClosed: intToBool(serverEntity.isClosed!),
                   type: toLocalType(serverEntity.type.orEmpty),
                   photoMin: serverEntity.photoMin.orEmpty,
                   photoAvg: serverEntity.photoAvg.orEmpty,
                   photoMax: serverEntity.photoMax.orEmpty)
    }
}


private extension GroupModelMapper {
    func intToBool(_ arg: Int?) -> Bool {
        if (arg == nil) {
            return true
        }
        
        switch (arg) {
        case 0: return false
        case 1: return true
        default: return true
        }
    }
}

private extension GroupModelMapper {
    func toLocalType(_ arg: String?) -> String {
        if (arg == nil) {
            return ""
        }
        
        switch arg {
        case "page": return "Публичная страница"
        case "group": return "Группа"
        case "event": return "Мероприятие"
        default: return ""
        }
    }
}
