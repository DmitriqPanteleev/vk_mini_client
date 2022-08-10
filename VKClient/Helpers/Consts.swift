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
        static let baseURL = "https://api.vk.com"
    }
}
