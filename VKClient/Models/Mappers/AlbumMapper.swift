//
//  AlbumMapper.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation

final class AlbumModelMapper: BaseModelMapper<AlbumServerModel, AlbumModel> {
    
    override func toLocal(serverEntity: AlbumServerModel) -> AlbumModel {
        AlbumModel(id: serverEntity.id,
                   ownerID: serverEntity.ownerID ?? 0,
                   size: serverEntity.size ?? 0,
                   title: serverEntity.title.orEmpty,
                   canUpload: intToBool(serverEntity.canUpload),
                   created: serverEntity.created ?? 0,
                   description: serverEntity.description.orEmpty,
                   canDelete: serverEntity.canDelete ?? false,
                   thumbID: serverEntity.thumbID ?? 0,
                   thumbIsLast: intToBool(serverEntity.thumbIsLast),
                   updated: serverEntity.updated ?? 0,
                   thumbSource: serverEntity.thumbSource)
    }
}

private extension AlbumModelMapper {
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
