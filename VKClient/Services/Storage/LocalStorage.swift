//
//  LocalStorage.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import Foundation

// token
// 253Dvk1.a.M1q24yGSnG8McNopxeSpainzD40Of14-Rjucto3Dqr2tB2vJ39vKwQbvxh80TXN_QSR7C6jGkm__ClTsqPV4A83gimSVappmqBMuyEyx2OcBgvTlrwyZphZ9iblIET37anDaJbpOKhNDLrcFlCQBDCpl-aVnG_68vPJWCBI26NR8iPMyMkMXyq8AkI-G06ud

// owner_id
// 400114525

enum LocalStorageKey: String {
    case token
    case expiresIn
    case vkID
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
    
    var expiresIn: String? {
        get {
            userDefaults.string(forKey: LocalStorageKey.expiresIn.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.expiresIn.rawValue)
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
}
