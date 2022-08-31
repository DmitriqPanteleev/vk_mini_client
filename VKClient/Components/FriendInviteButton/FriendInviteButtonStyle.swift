//
//  FriendInviteButtonStyle.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 26.08.2022.
//

import Foundation
import SwiftUI

enum FriendInviteButtonStyle {
    case buttonToInvite
    case buttonAlreadyIsFriend
    
    var background: Color {
        switch self {
        case .buttonToInvite: return Color.black
        case .buttonAlreadyIsFriend: return Color.white
        }
    }
    
    var textColor: Color {
        switch self {
        case .buttonToInvite: return Color.white
        case .buttonAlreadyIsFriend: return Color.black
        }
        
    }
    
    var icon: some View {
        switch self {
        case .buttonToInvite:
            return Image(systemName: "person.badge.plus")
                .foregroundColor(.white)
        case .buttonAlreadyIsFriend:
            return Image(systemName: "person.fill.checkmark")
                .foregroundColor(.black)
        }
    }
    
    var stroke: CGFloat {
        switch self {
        case .buttonToInvite:
            return 0
        case .buttonAlreadyIsFriend:
            return 2
        }
    }
    
    var title: String {
        switch self {
        case .buttonToInvite: return "Добавить в друзья"
        case .buttonAlreadyIsFriend: return "В друзьях"
        }
    }
}


