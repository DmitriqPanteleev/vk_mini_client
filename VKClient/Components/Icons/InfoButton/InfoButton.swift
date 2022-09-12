//
//  InfoButton.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 26.08.2022.
//

import SwiftUI

struct InfoButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .colorMultiply(.gray)
                    .padding(.trailing, 2)
                Text("Подробная информация")
                    .font(.callout)
                    .colorMultiply(.gray)
            }
        }
    }
}

//struct InfoButton_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoButton()
//    }
//}
