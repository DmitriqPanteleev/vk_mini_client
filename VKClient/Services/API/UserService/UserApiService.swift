//
//  UserApiService.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation
import Combine

struct UserApiService {
    let provider = Provider<UserApi>()
}

extension UserApiService {
    
    func getUser(id: Int) -> AnyPublisher<UserModel, APIError> {
        provider.requestPublisher(.getUser(id: id))
            .filterSuccessfulStatusCodes()
            .map(UserResponse.self)
            .map {
                $0.response }
            .map { UserMapper().toLocal(list: $0).first! }
            .mapError({ error in
                print(error)
                   return  .bad
            })
            .eraseToAnyPublisher()
    }
}
