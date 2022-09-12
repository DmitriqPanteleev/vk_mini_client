//
//  LocalStorage.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import Foundation
import Combine

enum LocalStorageKey: String {
    case token
    case vkID
    case isAuthorized
}


struct LocalStorage {
    
    // init UserDefaults' singleton
    private let userDefaults = UserDefaults.standard
    
    // creating Singleton
    static var current = LocalStorage()
    
    private init() {}
    
    // variables which should be in local storage
    var token: String? {
        get {
            userDefaults.string(forKey: LocalStorageKey.token.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.token.rawValue)
        }
    }
    
    var vkID: Int? {
        get {
            userDefaults.integer(forKey: LocalStorageKey.vkID.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.vkID.rawValue)
        }
    }
    
    var isAuthorized: Bool {
        get {
            userDefaults.bool(forKey: LocalStorageKey.isAuthorized.rawValue)
        }
        set {
            userDefaults.setValue(newValue, forKey: LocalStorageKey.isAuthorized.rawValue)
        }
    }
}
