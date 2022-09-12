//
//  AnimatedAppBarStyles.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 11.09.2022.
//

import Foundation
import SwiftUI

enum AnimatedAppBarStyle {
    case forFriends(online: Int)
    case forGroups
}

extension AnimatedAppBarStyle {
    var title: Text {
        switch self {
        case .forFriends:
            return Text("Мои друзья")
                .font(.title)
                .foregroundColor(.black)
        case .forGroups:
            return Text("Мои группы")
                .font(.title)
                .foregroundColor(.black.opacity(0.6))
        }
    }
    
    var subtitle: Text? {
        switch self {
        case .forFriends(let online):
            return Text("Онлайн - \(online)")
        case .forGroups:
            return nil
        }
    }
}
