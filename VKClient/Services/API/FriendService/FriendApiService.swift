//
//  FriendListService.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation
import Moya
import Combine
import CombineMoya

struct FriendApiService {
    let provider = Provider<FriendApi>()
}

extension FriendApiService {
    
    func getFriends(id: Int?) -> AnyPublisher<[FriendModel], APIError> {
        provider.requestPublisher(.getFriends(ownerId: id))
            .filterSuccessfulStatusCodes()
            .map(ServerResponse.self)
            .map { $0.response.items }
            .map { FriendModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .bad
            })
            .eraseToAnyPublisher()
    }
}
