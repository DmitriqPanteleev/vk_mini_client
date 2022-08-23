//
//  GroupCellView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import SwiftUI

struct GroupCellView: View {
    
    let model: GroupModel
    
    var body: some View {
        HStack {
            NetworkImage(imageURL: URL(string: model.photoMin))
            titleAndSubs
            Spacer()
            Text("\(model.subsCount) под.")
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}

private extension GroupCellView {
    var titleAndSubs: some View {
        VStack(alignment: .leading) {
            Text(model.name)
                .lineLimit(1)
            Text(model.activity)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 5)
    }
    
    @ViewBuilder func describtion(_ sub: String?) -> some View {
        if (sub!.lengthOfBytes(using: .ascii) > 1) {
            Text(sub!.prefix(1))
        }
        else {
            Text(sub!)
        }
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView(model: GroupModel(id: 5,
                                        verified: false,
                                        desc: "Просто какое-то описание для заглушки, немного более развернутое, чем обычно, чтобы посмотреть на поведение текста",
                                        subsCount: 10345003,
                                        activity: "Типа активити",
                                        status: "",
                                        name: "Публичный паблик",
                                        screenName: "public",
                                        isClosed: false,
                                        type: "page",
                                        photoMin: "",
                                        photoAvg: "",
                                        photoMax: ""))
    }
}
