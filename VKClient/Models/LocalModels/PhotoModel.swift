//
//  PhotoModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 27.08.2022.
//

import Foundation

struct PhotoModel: Identifiable{
    let id: Int
    let albumID: Int
    let date: Int
    let postID: Int
    let urls: [String]
    let likes: Int
    let comments: Int
    let reposts: Int
}
