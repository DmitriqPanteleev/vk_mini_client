//
//  ServerResponseModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 03.09.2022.
//

import Foundation

struct ServerResponse<T>: Decodable where T: Decodable {
    let response: [T]
}
