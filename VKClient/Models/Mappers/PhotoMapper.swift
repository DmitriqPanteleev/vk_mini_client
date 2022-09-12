//
//  PhotoMapper.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 28.08.2022.
//

import Foundation

final class PhotoModelMapper: BaseModelMapper<PhotoServerModel, PhotoModel> {
    override func toLocal(serverEntity: PhotoServerModel) -> PhotoModel {
        PhotoModel(id: serverEntity.id.orEmpty,
                   albumID: serverEntity.albumID.orEmpty,
                   date: serverEntity.date.orEmpty,
                   postID: serverEntity.postID.orEmpty,
                   urls: sizeMapper(serverEntity.sizes),
                   likes: serverEntity.likes.count.orEmpty,
                   comments: serverEntity.comments?.count ?? -1,
                   reposts: serverEntity.reposts?.count ?? -1)
    }
}

private extension PhotoModelMapper {
    func sizeMapper(_ photoURL: [Size]?) -> [String] {
        photoURL?
            .compactMap {
                $0.url
            } ?? Array(repeating: "", count: 1)
    }
}
