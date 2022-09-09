//
//  Extensions + Sequence.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 05.09.2022.
//

import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
