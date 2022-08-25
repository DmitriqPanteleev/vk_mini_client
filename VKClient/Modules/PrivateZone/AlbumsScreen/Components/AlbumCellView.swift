//
//  AlbumCellView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 20.08.2022.
//

import SwiftUI

struct AlbumCellView: View {
    
    let model: AlbumModel
    
    var body: some View {
        VStack {
            mainImg()
            title()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }
}

extension AlbumCellView {
    @ViewBuilder func mainImg() -> some View {
        NetworkImage(imageURL: URL(string: model.thumbSource!), frameWidth: 150, frameHeight: 150, radius: 20)
    }
    
    @ViewBuilder func title() -> some View {
        HStack {
            VStack {
                Text(model.title)
                    .font(.caption)
                    .lineLimit(1)
                Text("\(model.size)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AlbumCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCellView(model: AlbumModel(id: 0,
                                        ownerID: 0,
                                        size: 10000,
                                        title: "Album",
                                        canUpload: false,
                                        created: 10,
                                        description: "",
                                        canDelete: false,
                                        thumbID: 0,
                                        thumbIsLast: false,
                                        updated: 10,
                                        thumbSource: "https://catherineasquithgallery.com/uploads/posts/2021-02/1614280269_53-p-chernii-fon-dlya-futazhei-68.jpg"))
    }
}
