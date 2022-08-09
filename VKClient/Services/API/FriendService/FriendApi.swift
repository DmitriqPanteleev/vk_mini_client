//
//  FriendList.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation
import Moya

enum FriendApi {
    case getFriends
    case getFriend(id: Int)
}

private extension FriendApi {

    // to create full url
    var buildedURL: URL? {
        let storage = LocalStorage.current
        
        guard var urlComponents = URLComponents(string: Consts.GetFriends.baseURL) else {
            return nil
        }
        
        let items = [
            URLQueryItem(name: Consts.GetFriends.countKey, value: Consts.GetFriends.countValue),
            URLQueryItem(name: Consts.GetFriends.fieldsKey, value: Consts.GetFriends.fieldsValue),
            URLQueryItem(name: Consts.GetFriends.tokenKey, value: storage.token),
            URLQueryItem(name: Consts.GetFriends.verKey, value: Consts.GetFriends.verValue)
        ]
        
        urlComponents.queryItems = items
        return urlComponents.url
    }
}

extension FriendApi: TargetType {
    
    var baseURL: URL {
        self.buildedURL!
    }
    
    var path: String {
        switch self {
        case let .getFriend(id):
            return "" // TODO: add path
        case .getFriends:
            return "" // TODO: add path
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        [:]
    }
}
