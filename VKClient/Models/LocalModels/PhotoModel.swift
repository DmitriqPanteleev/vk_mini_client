//
//  PhotoModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 27.08.2022.
//

import Foundation

struct PhotoModel: Identifiable {
    let albumID, date, id, ownerID: Int
    let canComment: Bool
    let minUrl: String
    let maxUrl: String
    let text: String
    let userID: Int
    let hasTags: Bool
    let likes: Likes
    let comments, reposts, tags: Comments
}
