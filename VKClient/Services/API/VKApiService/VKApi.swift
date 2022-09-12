//
//  UserApi.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation
import Moya

enum VKApi {
    case getGroups
    case getUser(id: Int)
    case getFriends(ownerId: Int?)
    case getAlbums(ownerId: String?)
    case getPhotos(ownerId: String?, albumId: String?)
}

extension VKApi: TargetType {
    var baseURL: URL {
        URL(string: Consts.base.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getFriends: return "/method/friends.get"
        case .getUser(_): return "/method/users.get"
        case .getGroups: return "/method/groups.get"
        case .getPhotos(_, _): return "/method/photos.get"
        case .getAlbums: return "/method/photos.getAlbums"
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
            params["fields"] = "bdate, city, common_count, counters, domain, followers_count, last_seen, online, photo_max_orig, status, is_friend"
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getFriends(let id):
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            if (id != nil) {
                params["user_id"] = id
            }
            params["order"] = "name"
            params["count"] = 300
            params["fields"] = "online, photo_50"
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
            
        case .getPhotos(let ownerId, let albumId):
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            if (ownerId != nil) {
                params["owner_id"] = ownerId
            }
            if (albumId != nil) {
                params["album_id"] = albumId
            } else {
                params["album_id"] = "wall"
            }
            params["extended"] = 1
            params["count"] = 1000
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getAlbums(let ownerId):
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            if (ownerId != nil) {
                params["owner_id"] = ownerId
            } else {
                params["owner_id"] = LocalStorage.current.vkID
            }
            params["need_system"] = "1"
            params["need_covers"] = "1"
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
