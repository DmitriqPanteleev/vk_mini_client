//
//  GroupModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import Foundation

struct GroupModel: Identifiable {
    let id: Int
    let verified: Bool
    let desc: String
    let subsCount: Int
    let activity: String
    let status: String
    let name: String
    let screenName: String
    let isClosed: Bool
    let type: String
    let photoMin: String
    let photoAvg: String
    let photoMax: String
}
