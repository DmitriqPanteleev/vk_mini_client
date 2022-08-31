//
//  AlbumApi.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import Moya

enum PhotoApi {
    case get(ownerId: String?, albumId: String?)
    case getAlbums(ownerId: String?)
}

extension PhotoApi: TargetType {
    var baseURL: URL {
        URL(string: Consts.base.baseURL)!
    }
    
    var path: String {
        switch self {
        case .get: return "/method/photos.get"
        case .getAlbums: return "/method/photos.getAlbums"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .get(let ownerId, let albumId):
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
            params["v"] = "5.131"
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getAlbums(let ownerId):
            var params: [String: Any] = [:]
            params["access_token"] = LocalStorage.current.token
            if (ownerId != nil) {
                params["owner_id"] = ownerId
            }
            params["owner_id"] = LocalStorage.current.vkID
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
