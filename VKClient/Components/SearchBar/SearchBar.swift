//
//  SearchBar.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 11.09.2022.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isActive = false
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .textFieldStyle(DefaultTextFieldStyle())
        }
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text: )
//    }
//}
