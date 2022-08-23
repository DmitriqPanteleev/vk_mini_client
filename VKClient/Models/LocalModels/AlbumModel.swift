//
//  AlbumModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation

struct AlbumModel: Identifiable {
    let id: Int
    let ownerID: Int
    let size: Int
    let title: String
    let canUpload: Bool
    let created: Int
    let description: String
    let canDelete: Bool
    let thumbID: Int
    let thumbIsLast: Bool
    let updated: Int
    let thumbSource: String?
}
