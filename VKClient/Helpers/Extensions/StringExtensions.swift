//
//  StringExtensions.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import Foundation

extension Optional where Wrapped == String {
    
    var orEmpty: String {
        guard let value = self else { return "" }
        return value
    }
}
