//
//  Consts.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 04.08.2022.
//

import Foundation


struct Consts {
    // For authorization
    struct VK {
        static let vkURL = "https://oauth.vk.com/authorize"
        static let clientIDKey = "client_id"
        static let clientIDValue = "51393959"
        static let displayKey = "display"
        static let displayValue = "mobile"
        static let scopeKey = "scope"
        static let scopeValue = "12"
        static let responseTypeKey = "response_type"
        static let responseTypeValue = "token"
        static let redirectUriKey = "redirect_uri"
        static let redirectUriValue = "https://oauth.vk.com/blank.html"
    }
    
    // To get friends from VK API
    struct GetFriends {
        static let baseURL = "https://api.vk.com/method/friends.get"
        static let clientIDKey = "client_id"
        static let fieldsKey = "fields"
        static let fieldsValue = "online"
        static let tokenKey = "access_token"
        static let countKey = "count"
        static let countValue = "10"
        static let verKey = "v"
        static let verValue = "5.131"
//        static let params = "?count=\(count)&fields=online&access_token=\(LocalStorage.current.token)&v=5.131"
    }
}
