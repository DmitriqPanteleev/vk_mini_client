//
//  UserModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation

struct UserModel: Identifiable {
    let id: Int
    let domain: String
    let city: String
    let photoMaxOrig: String
    let status: String
    let lastSeen: String
    let followersCount: Int
    let commonCount: Int
    let counters: [String: Int]
    let online: Bool
    let firstName: String
    let lastName: String
    let canAccessClosed, isClosed: Bool
    
    var fullName: String {
        "\(lastName) \(firstName)"
    }
}
