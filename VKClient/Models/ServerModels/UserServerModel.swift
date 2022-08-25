//
//  UserServerModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation

// MARK: - Welcome
struct UserResponse: Decodable {
    let response: [UserServerModel]
}


// MARK: - ServerModel
struct UserServerModel: Decodable {
    let id: Int
    let domain, bdate: String?
    let city: City?
    let photoMaxOrig: String?
    let status: String?
    let lastSeen: LastSeen?
    let followersCount, commonCount: Int?
    let counters: [String: Int]?
    let online: Int?
    let firstName, lastName: String
    let canAccessClosed, isClosed: Bool

    enum CodingKeys: String, CodingKey {
        case id, domain, bdate, city
        case photoMaxOrig = "photo_max_orig"
        case status
        case lastSeen = "last_seen"
        case followersCount = "followers_count"
        case commonCount = "common_count"
        case counters, online
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
    }
}

// MARK: - LastSeen
struct LastSeen: Decodable {
    let platform, time: Int
}

// MARK: - City
struct City: Decodable {
    let id: Int
    let title: String
}
