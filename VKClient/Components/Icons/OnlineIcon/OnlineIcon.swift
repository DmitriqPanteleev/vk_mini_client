//
//  OnlineIcon.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 26.08.2022.
//

import SwiftUI

struct OnlineIcon: View {
    var body: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 10, height: 10)
            .foregroundColor(.green)
    }
}

struct OnlineIcon_Previews: PreviewProvider {
    static var previews: some View {
        OnlineIcon()
    }
}
