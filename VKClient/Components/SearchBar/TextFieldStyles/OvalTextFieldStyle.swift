//
//  OvalTextField.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 11.09.2022.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}
