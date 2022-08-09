//
//  FriendModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation

struct FriendModel: Identifiable {
    let id: Int
    let firstName: String
    let secondName: String
    let isOnline: Bool
    
    var fullName: String {
        "\(secondName) \(firstName)"
    }
}
