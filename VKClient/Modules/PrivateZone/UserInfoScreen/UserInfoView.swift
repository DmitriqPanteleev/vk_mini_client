//
//  FriendInfoView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import SwiftUI

struct UserInfoView: View {
    
    @StateObject var viewModel: UserInfoViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                domainView
                mainIfoView
                friendInfo
                HStack {
                    detailInfo
                    Spacer()
                }
                friendsList
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Подробнее")
        .onAppear(perform: onApperSend)
    }
}

private extension UserInfoView {
    
    @ViewBuilder var mainIfoView: some View {
        if let model = viewModel.output.user {
            HStack {
                NetworkImage(imageURL: URL(string: model.photoMaxOrig), frameWidth: 80, frameHeight: 80, radius: 80)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(model.fullName)
                            .lineLimit(1)
                            .font(.body)
                        if (model.online) {
                            OnlineIcon()
                        }
                    }
                    
                    if (model.status != "") {
                        Text(model.status)
                            .lineLimit(1)
                            .font(.caption)
                            .padding(.top, 1)
                            .padding(.bottom, 3)
                    }
                    
                    if (model.online) {
                        Text("online")
                            .lineLimit(1)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    } else {
                        Text("был в сети \(model.lastSeen)")
                            .lineLimit(1)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                .frame(alignment: .leading)
                Spacer()
            }
        }
    }
    
    // domain - краткая ссылка
    @ViewBuilder var domainView: some View {
        HStack {
            if let model = viewModel.output.user {
                Text(model.domain)
                    .font(.title2)
            }
            Spacer()
        }
        .padding(.vertical, 10)
    }
    
    @ViewBuilder var friendInfo: some View {
        if let model = viewModel.output.user {
            if (model.isFriend) {
                FriendInviteButton(style: .buttonAlreadyIsFriend)
                    .padding(.vertical, 10)
            } else {
                FriendInviteButton(style: .buttonToInvite)
                    .padding(.vertical, 10)
            }
        }
    }
    
    @ViewBuilder var detailInfo: some View {
        if let model = viewModel.output.user {
            VStack(alignment: .leading) {
                if (!model.city.isEmpty) {
                    Text("Город: \(model.city)")
                        .font(.caption)
                        .padding(.bottom, 1)
                }
                
                if (!model.bdate.isEmpty) {
                    Text("День рождения: \(model.bdate)")
                        .font(.caption)
                        .padding(.bottom, 1)
                }
                
                if (model.followersCount > 0) {
                    Text("Подписчики: \(model.followersCount)")
                        .font(.caption)
                        .padding(.bottom, 1)
                }
                
                InfoButton(action: {
                    onInfoButtonTap()
                })
            }
            .frame(alignment: .leading)
            .padding(.top, 10)
        }
    }
    
    @ViewBuilder var friendsList: some View {
        if let model = viewModel.output.user {
            VStack(alignment: .leading) {
                HStack {
                    Text("ДРУЗЬЯ ")
                        .font(.caption)
                    Text("\(model.counters["friends"]!)")
                        .foregroundColor(.gray)
                        .font(.caption2)
                    if (model.counters["mutual_friends"]! > 0) {
                        Text("· общих \(model.counters["mutual_friends"]!)")
                            .foregroundColor(.gray)
                            .font(.caption2)
                    }
                }
                .padding(.top, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(viewModel.output.userFriends) { model in
                            FriendButton(model: model)
                        }
                    }
                }
            }
        }
    }
    
}

private extension UserInfoView {
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
    func onInfoButtonTap() {
        viewModel.input.onInfoButtonTap.send()
    }
}

//struct FriendInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendInfoView(viewModel: FriendInfoViewModel(friendId: 23))
//    }
//}
