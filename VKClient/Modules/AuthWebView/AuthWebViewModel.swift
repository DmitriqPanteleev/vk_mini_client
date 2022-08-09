//
//  AuthWebViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation

final class AuthWebViewModel: ObservableObject {
    
    var url: URL? {
        guard var urlComps = URLComponents(string: Consts.VK.vkURL) else {
            return nil
        }
        
        let items = [
            URLQueryItem(name: Consts.VK.clientIDKey, value: Consts.VK.clientIDValue),
            URLQueryItem(name: Consts.VK.redirectUriKey, value: Consts.VK.redirectUriValue),
            URLQueryItem(name: Consts.VK.scopeKey, value: Consts.VK.scopeValue),
            URLQueryItem(name: Consts.VK.displayKey, value: Consts.VK.displayValue),
            URLQueryItem(name: Consts.VK.responseTypeKey, value: Consts.VK.responseTypeValue),
        ]
        urlComps.queryItems = items
        return urlComps.url
    }
    
    var token = LocalStorage.current.token
    
}
