//
//  PhotoMapper.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 28.08.2022.
//

import Foundation

final class PhotoModelMapper: BaseModelMapper<PhotoServerModel, PhotoModel> {
    override func toLocal(serverEntity: PhotoServerModel) -> PhotoModel {
        PhotoModel(albumID: serverEntity.albumID,
                   date: serverEntity.date,
                   id: serverEntity.id,
                   ownerID: serverEntity.ownerID,
                   canComment: TypesCast.intToBool(serverEntity.ownerID),
                   minUrl: serverEntity.sizes.first?.url ?? "",
                   maxUrl: serverEntity.sizes.last?.url ?? "",
                   text: serverEntity.text,
                   userID: serverEntity.userID,
                   hasTags: serverEntity.hasTags,
                   likes: serverEntity.likes,
                   comments: serverEntity.comments,
                   reposts: serverEntity.reposts,
                   tags: serverEntity.tags)
    }
}
