//
//  TypesCast.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation

final class TypesCast {

    static func intToBool(_ serverIsOnline: Int?) -> Bool {
        if (serverIsOnline == nil) {
            return true
        }
        
        switch (serverIsOnline) {
        case 0: return false
        case 1: return true
        default: return true
        }
    }
}
