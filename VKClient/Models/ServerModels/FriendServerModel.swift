//
//  FriendModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation
import Moya

struct FriendServerModel: Decodable {
    let id: Int
    let online: Int?
    let trackCode: String?
    let photoMin: String?
    let firstName: String?
    let lastName: String?
    let canAccessClosed: Bool?
    let isClosed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case online = "online"
        case trackCode = "track_code"
        case photoMin = "photo_50"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
    }
}
