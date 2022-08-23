//
//  LocalStorage.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import Foundation
import Combine

// token
// vk1.a.LTQJHwRPhJO8qlyftZGaiP9b2Wg9PP_IW7AjafZSWjtZ8m66MwYo2vBF1fRwADUO9TTAlff_rUSiyQZmWM8q8ciyTzJi45lysbuYlZgLg6n1e3ijRlkGXk1tblk3ce9wiVoicZuENRIQSt52Nje6KuwilPesRj81pMhXn_ZFsogPELKGMla4NXDd312dQj33

// owner_id
// 400114525

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
