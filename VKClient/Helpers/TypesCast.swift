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
        
        // TODO: if else
        switch (serverIsOnline) {
        case 0: return false
        case 1: return true
        default: return true
        }
    }
    
    
    
    static func unixDateToTimeString(_ serverDate: Int) -> String {
        if (serverDate == 0) {
            return "недавно"
        } else {
            let date = Date(timeIntervalSince1970: Double(serverDate))
            let calendar = Calendar.current
            
            let hour = calendar.component(.hour, from: date)
            let min = calendar.component(.minute, from: date)
            
            let result = "\(hour):\(min)"
            return result
        }
    }
}
