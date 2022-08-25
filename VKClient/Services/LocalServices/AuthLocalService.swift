//
//  AuthLocalService.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import Combine

struct AuthLocalService {
    // creates singleton
    static var shared = AuthLocalService()
    // status of authorization (to listen)
    let status: CurrentValueSubject<Bool, Never>
    
    private init() {
        self.status = CurrentValueSubject<Bool, Never>(LocalStorage.current.isAuthorized)
    }
}
