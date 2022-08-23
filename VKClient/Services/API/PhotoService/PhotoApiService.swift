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
    
    func getAlbums() -> AnyPublisher<[AlbumModel], APIError> {
        provider.requestPublisher(.getAlbums)
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
