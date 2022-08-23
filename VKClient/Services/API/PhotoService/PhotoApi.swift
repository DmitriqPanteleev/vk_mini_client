//
//  AlbumApi.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import Moya

enum PhotoApi {
    case get
    case getAlbum(id: Int)
    case getAlbums
}

extension PhotoApi: TargetType {
    var baseURL: URL {
        URL(string: Consts.base.baseURL)!
    }
    
    var path: String {
        switch self {
        case .get: return "/method/photos.get"
        case .getAlbum(_): return ""
        case .getAlbums: return "/method/photos.getAlbums"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .get:
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            params["album_id"] = "wall"
            params["extended"] = 1
            params["offset"] = 10
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getAlbum(_):
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            params["need_covers"] = "wall"
            //params["offset"] = 10
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getAlbums:
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            params["owner_id"] = LocalStorage.current.vkID
            params["need_system"] = "1"
            params["need_covers"] = "1"
            //params["offset"] = 10
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    
}
