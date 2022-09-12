//
//  DetailInfoView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 27.08.2022.
//

import SwiftUI

struct DetailInfoView: View {
    
    let model: UserModel
    
    var body: some View {
        VStack(alignment: .leading) {
            status
            Divider()
            commonInfo
            Divider()
            mediaInfo
            Spacer()
        }
        .frame(alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }
}

private extension DetailInfoView {
    @ViewBuilder var status: some View {
        if (!model.status.isEmpty) {
            HStack {
                Image(systemName: "message")
                    .padding(.trailing, 5)
                Text(model.status)
                    .font(.caption)
                    .padding(.bottom, 1)
                Spacer()
            }
        }
    }
    
    @ViewBuilder var commonInfo: some View {
        if (!model.city.isEmpty) {
            HStack {
                Image(systemName: "house")
                    .padding(.trailing, 5)
                Text("Город: \(model.city)")
                    .font(.caption)
                    .padding(.bottom, 1)
                Spacer()
            }
        }
        
        if (!model.bdate.isEmpty) {
            HStack {
                Image(systemName: "birthday.cake")
                    .padding(.trailing, 5)
                Text("День рождения: \(model.bdate)")
                    .font(.caption)
                    .padding(.bottom, 1)
                Spacer()
            }
        }
        
        if (model.followersCount > 0) {
            HStack {
                Image(systemName: "person.2.wave.2")
                    .padding(.trailing, 5)
                Text("Подписчики: \(model.followersCount)")
                    .font(.caption)
                    .padding(.bottom, 1)
                Spacer()
            }
        }
    }
    
    @ViewBuilder var mediaInfo: some View {
        if (!model.counters.isEmpty) {
            HStack {
                Image(systemName: "person.2.fill")
                    .padding(.trailing, 5)
                Text("Друзья \(model.counters["friends"]!) (общие \(model.counters["mutual_friends"]!))")
                    .font(.caption)
                    .padding(.bottom, 1)
                Spacer()
            }
            
            if(model.counters["audios"]! > 0) {
                HStack {
                    Image(systemName: "music.note.list")
                        .padding(.trailing, 5)
                    Text("Аудиозаписи: \(model.counters["audios"]!)")
                        .font(.caption)
                        .padding(.bottom, 1)
                    Spacer()
                }
            }
            
            if(model.counters["videos"]! > 0) {
                HStack {
                    Image(systemName: "video.fill")
                        .padding(.trailing, 5)
                    Text("Видеозаписи: \(model.counters["videos"]!)")
                        .font(.caption)
                        .padding(.bottom, 1)
                    Spacer()
                }
            }
        }
    }
}

//struct DetailInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailInfoView()
//    }
//}
