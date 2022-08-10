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

extension FriendApi: TargetType {
    
    var baseURL: URL {
        URL(string: Consts.GetFriends.baseURL)!
    }
    
    var path: String {
        switch self {
        case let .getFriend(id):
            return "" // TODO: add path
        case .getFriends:
            return "/method/friends.get"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        var params: [String: Any] = [:]
        params["access_token"] = LocalStorage.current.token
        params["count"] = 100
        params["fields"] = "online"
        params["v"] = "5.131"
        
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        [:]
    }
}
