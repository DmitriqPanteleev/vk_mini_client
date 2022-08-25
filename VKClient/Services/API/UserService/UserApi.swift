//
//  UserApi.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation
import Moya

enum UserApi {
    case getUser(id: Int)
}

extension UserApi: TargetType {
    var baseURL: URL {
        URL(string: Consts.base.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getUser(_): return "/method/users.get"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .getUser(let id):
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            params["user_ids"] = "\(id)"
            params["fields"] = "bdate, city, common_count, counters, domain, followers_count, last_seen, online, photo_max_orig, status"
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    
}
