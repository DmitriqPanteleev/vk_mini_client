//
//  GroupService.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import Foundation
import Moya
import Combine
import CombineMoya

struct GroupApiService {
    let provider = Provider<GroupApi>()
}
 
extension GroupApiService {
    func getGroups() -> AnyPublisher<[GroupModel], APIError> {
        provider.requestPublisher(.getGroups)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse2.self)
            .map { $0.response.items }
            .map { GroupModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .bad
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
