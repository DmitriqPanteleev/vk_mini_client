//
//  AlbumServerModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import Moya

struct AlbumServerModel: Decodable {
    let id: Int
    let ownerID: Int?
    let size: Int?
    let title: String?
    let canUpload: Int?
    let created: Int?
    let description: String?
    let canDelete: Bool?
    let thumbID: Int?
    let thumbIsLast: Int?
    let updated: Int?
    let thumbSource: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case ownerID = "owner_id"
        case size = "size"
        case title = "title"
        case canUpload = "can_upload"
        case created = "created"
        case description = "description"
        case canDelete = "can_delete"
        case thumbID = "thumb_id"
        case thumbIsLast = "thumb_is_last"
        case updated = "updated"
        case thumbSource = "thumb_src"
    }
}
