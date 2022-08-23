//
//  GroupServerModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import Foundation
import Moya

struct ServerResponse2: Decodable {
    let response: ServerGroupResponse
}

struct ServerGroupResponse: Decodable {
    let count: Int
    let items: [GroupServerModel]
}

struct GroupServerModel: Decodable {
    let id: Int
    let verified: Int?
    let desc: String?
    let subsCount: Int?
    let activity: String?
    let status: String?
    let name: String?
    let screenName: String?
    let isClosed: Int?
    let type: String?
    let photoMin: String?
    let photoAvg: String?
    let photoMax: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case verified = "verified"
        case desc = "description"
        case subsCount = "members_count"
        case activity = "activity"
        case status = "status"
        case name = "name"
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type = "type"
        case photoMin = "photo_50"
        case photoAvg = "photo_100"
        case photoMax = "photo_200"
    }
}
