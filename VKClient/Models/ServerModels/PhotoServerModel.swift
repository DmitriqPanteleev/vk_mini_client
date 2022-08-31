//
//  PhotoServerModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 27.08.2022.
//

import Foundation

// MARK: - Welcome
struct PhotoResponse: Decodable {
    let response: PhotoResponseBody
}

// MARK: - Response
struct PhotoResponseBody: Decodable {
    let count: Int
    let items: [PhotoServerModel]
}

// MARK: - Item
struct PhotoServerModel: Decodable {
    let albumID, date, id, ownerID: Int
    let canComment: Int
    let sizes: [Size]
    let text: String
    let userID: Int
    let hasTags: Bool
    let likes: Likes
    let comments, reposts, tags: Comments

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case canComment = "can_comment"
        case sizes, text
        case userID = "user_id"
        case hasTags = "has_tags"
        case likes, comments, reposts, tags
    }
}

// MARK: - Comments
struct Comments: Codable {
    let count: Int
}

// MARK: - Likes
struct Likes: Codable {
    let count, userLikes: Int

    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

// MARK: - Size
struct Size: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}

