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
}

extension FriendApi: TargetType {
    
    var baseURL: URL {
        URL(string: Consts.base.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getFriends:
            return "/method/friends.get"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .getFriends:
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            params["count"] = 100
            params["fields"] = "online, photo_50"
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
