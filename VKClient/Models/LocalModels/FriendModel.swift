//
//  FriendModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation

struct FriendModel: Identifiable {
    let id: Int
    let isOnline: Bool
    let trackCode: String
    let photoMin: String
    let firstName: String
    let lastName: String
    let canAccessClosed: Bool
    let isClosed: Bool
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
