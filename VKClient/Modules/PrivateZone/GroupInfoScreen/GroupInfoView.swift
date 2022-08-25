//
//  GroupInfoView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 16.08.2022.
//

import SwiftUI

struct GroupInfoView: View {
    
    let model: GroupModel
    
    var body: some View {
        VStack {
            commonInfo()
            subscribers()
            description()
            Spacer()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
    }
}

private extension GroupInfoView {
    @ViewBuilder func subscribers() -> some View {
        HStack(alignment: .center) {
            Text("Подписчики:")
                .font(.title3)
            Spacer()
            Text("\(model.subsCount)")
                .font(.title3)
        }
        .padding(.vertical, 10)
    }
    
    @ViewBuilder func commonInfo() -> some View {
        HStack(alignment: .center) {
            VStack (alignment: .leading) {
                HStack {
                    Text(model.name)
                        .font(.title)
                        .lineLimit(2)
                    isVerified(model.verified)
                }
                Text(model.type)
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            Spacer()
            NetworkImage(imageURL: URL(string: model.photoAvg), frameWidth: 80, frameHeight: 80, radius: 80)
        }
    }
    
    @ViewBuilder func description() -> some View {
        if (model.desc == "") {
            Text("Описание отсутствует")
        } else {
            VStack(alignment: .leading) {
                Text("Описание:")
                    .font(.title3)
                    .padding(.all, 0)
                HStack {
                    Text(model.desc)
                        .padding(.all, 0)
                    Spacer()
                }
                .padding(.vertical, 10)
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 20)
        }
    }
    
    @ViewBuilder func isVerified(_ verified: Bool) -> some View {
        if (verified) {
            Image(systemName: "checkmark.seal.fill")
                .foregroundColor(.blue)
        }
    }
}

struct GroupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupInfoView(model: GroupModel(id: 5,
                                        verified: true,
                                        desc: "Просто какое-то описание для заглушки, немного более развернутое, чем обычно, чтобы посмотреть на поведение текста",
                                        subsCount: 10345003,
                                        activity: "Типа активити",
                                        status: "efrwg",
                                        name: "Публичный паблик",
                                        screenName: "public",
                                        isClosed: false,
                                        type: "page",
                                        photoMin: "",
                                        photoAvg: "https://uprostim.com/wp-content/uploads/2021/04/image147-14.jpg",
                                        photoMax: "")
        )
    }
}
