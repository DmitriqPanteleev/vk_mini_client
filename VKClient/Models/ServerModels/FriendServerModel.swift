//
//  FriendModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation

struct FriendServerModel: Decodable {
    let id: Int
    let firstName: String
    let secondName: String
    let isOnline: Int
}
