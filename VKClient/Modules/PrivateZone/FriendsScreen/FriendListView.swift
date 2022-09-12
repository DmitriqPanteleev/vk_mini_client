//
//  FriendListView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import SwiftUI

struct FriendListView: View {
    
    @StateObject var viewModel: FriendListViewModel
    
    @State private var text = ""
    
    
    var body: some View {
        ZStack {
            ScrollViewReader { scrollProxy in
                friendsList
                    .padding(.top, 50)
                    .overlay(sectionIndexTitles(proxy: scrollProxy))
            }
        }
        .ignoresSafeArea()
        .onAppear(perform: onApperSend)
        .navigationBarHidden(true)
    }
}

private extension FriendListView {
    
    @ViewBuilder var friendsList: some View {
        let sections = viewModel.output.friendList.map {
            $0.firstName.first?.description
        }
            .uniqued()
        
        List {
            SearchBar(text: $text)
            ForEach(text == "" ?
                    sections
                    : ["Найдено"], id: \.self) { letter in
                Section(header: Text(letter!)) {
                    ForEach(
                        text == "" ?
                        viewModel.output.friendList.filter
                        {$0.firstName.first?.description == letter}
                        : viewModel.output.friendList.filter
                        { $0.fullName.lowercased().contains(text.lowercased()) }
                        , id: \.self) { friend in
                            FriendCellView(model: friend)
                                .onTapGesture {
                                    onFriendTapSend(friend.id)
                                }
                        }
                }
                .id(letter)
            }
        }
        .refreshable {
            onApperSend()
        }
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

private extension FriendListView {
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
    func onFriendTapSend(_ id: Int) {
        viewModel.input.onFriendTap.send(id)
    }
}

//struct FriendListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendListView()
//    }
//}
