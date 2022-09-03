//
//  ServerResponseModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 03.09.2022.
//

import Foundation

struct ServerListResponse<T>: Decodable where T: Decodable {
    let response: ServerModelResponse<T>
}

struct ServerModelResponse<T>: Decodable where T: Decodable {
    let count: Int
    let items: [T]
}
