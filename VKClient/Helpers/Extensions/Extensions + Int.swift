//
//  Extensions + Int.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 03.09.2022.
//

import Foundation

extension Optional where Wrapped == Int {
    
    var orEmpty: Int {
        guard let value = self else { return -1 }
        return value
    }
}
