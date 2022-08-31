//
//  AlbumService.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import Moya
import Combine
import CombineMoya

struct PhotoApiService {
    let provider = Provider<PhotoApi>()
}

extension PhotoApiService {
    
    func getPhotos(ownerId: String?, albumId: String?) -> AnyPublisher<[PhotoModel], APIError> {
        provider.requestPublisher(.get(ownerId: ownerId, albumId: albumId))
            .filterSuccessfulStatusCodes()
            .map(PhotoResponse.self)
            .map { $0.response.items }
            .map { PhotoModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                .bad
            })
            .eraseToAnyPublisher()
    }
    
    func getAlbums(ownerId: String?) -> AnyPublisher<[AlbumModel], APIError> {
        provider.requestPublisher(.getAlbums(ownerId: ownerId))
            .filterSuccessfulStatusCodes()
            .map(ServerResponse3.self)
            .map { $0.response.items }
            .map { AlbumModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .bad
            })
            .eraseToAnyPublisher()
    }
    
}

extension PhotoApiService: AlbumListAPIProtocol{}

protocol AlbumListAPIProtocol {
    func getAlbums(ownerId: String?) -> AnyPublisher<[AlbumModel], APIError>
}
