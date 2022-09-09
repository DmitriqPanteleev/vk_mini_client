//
//  FriendListView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import SwiftUI

struct FriendListView: View {
    
    @StateObject var viewModel: FriendListViewModel
    
    var body: some View {
        ZStack {
            ScrollViewReader { scrollProxy in
                testList
                .onAppear(perform: onApperSend)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Мои друзья")
                .overlay(sectionIndexTitles(proxy: scrollProxy))
            }
        }
    }
}

private extension FriendListView {
    var tableView: some View {
        LazyVStack {
            ForEach(viewModel.output.friendList) { model in
                FriendCellView(model: model)
                    .onTapGesture {
                        onFriendTapSend(model.id)
                    }
                Divider()
            }
        }
    }
    
   @ViewBuilder var testList: some View {
        let sections = viewModel.output.friendList.map {
            $0.firstName.first?.description
        }.uniqued()
        
        List {
            ForEach(sections, id: \.self) { letter in
                Section(header: Text(letter!)) {
                    ForEach(viewModel.output.friendList.filter
                            {$0.firstName.first?.description == letter}, id: \.self) { friend in
                        FriendCellView(model: friend)
                            .onTapGesture {
                                onFriendTapSend(friend.id)
                            }
                    }
                }
                .id(letter)
            }
            .refreshable {
                onApperSend()
            }
        }
        .refreshable {
            onApperSend()
        }
    }
}

private extension FriendListView {
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
    func onFriendTapSend(_ id: Int) {
        viewModel.input.onFriendTap.send(id)
    }
    
    @ViewBuilder func sectionIndexTitles(proxy: ScrollViewProxy) -> some View {
        let sections = viewModel.output.friendList.map {
            $0.firstName.first!.description
        }.uniqued()
        
        SectionIndexTitles(proxy: proxy, titles: sections)
          .frame(maxWidth: .infinity, alignment: .trailing)
          .padding()
      }
}

//struct FriendListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendListView()
//    }
//}
