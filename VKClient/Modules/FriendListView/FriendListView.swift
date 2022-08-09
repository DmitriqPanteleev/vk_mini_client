//
//  FriendListView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import SwiftUI

struct FriendListView: View {
    
    @StateObject private var viewModel = FriendListViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: onApperSend)
    }
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }

}

//private extension FriendListView {
//    func tableVIew() -> some View {
//        ScrollView(.vertical ,showsIndicators: false) {
//            ForEach(viewModel.output) { model in
//                FriendCellView(model: model)
//            }
//            Divider()
//                .foregroundColor(.gray)
//                .frame(width: 200, alignment: .trailing)
//                .padding(.all, 0)
//        }
//    }
//}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
