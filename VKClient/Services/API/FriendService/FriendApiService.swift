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
    
    func getFriends() -> AnyPublisher<[FriendServerModel], APIError> {
        provider.requestPublisher(.getFriends)
            .filterSuccessfulStatusCodes()
            .map([FriendServerModel].self)
            .mapError({ _ in
                    .bad
            })
            .eraseToAnyPublisher()
    }
    
}
