//
//  CustomUrlError.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import Foundation

enum CustomURLError: Error {
    // all usual cases of url's errors
    case invalidError
    
    // messages for any error's type
    var description: String {
        switch self {
        case .invalidError: return "URL's invalid. Try to check it!"
        }
    }
}
