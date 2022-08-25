//
//  GroupApi.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import Foundation
import Moya


enum GroupApi {
    case getGroups
    case getGroup(code: Int)
}

extension GroupApi: TargetType {
    
    var baseURL: URL {
        URL(string: Consts.base.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getGroup(_):
            return "/method/groups.getById"
        case .getGroups:
            return "/method/groups.get"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .getGroup(_):
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            //params["group_id"] =  id
            params["fields"] = "activity, description, members_count, verified, status"
            params["count"] = 10
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getGroups:
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            params["extended"] = 1
            params["fields"] = "activity, description, members_count"
            params["count"] = 56
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
