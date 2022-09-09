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
            mainImg
            title()
        }
    }
}

private extension AlbumCellView {
    
    var mainImg: some View {
        NetworkImage(imageURL: URL(string: model.thumbSource!), frameWidth: 80, frameHeight: 80, radius: 10)
    }
    
    func title() -> some View {
        HStack {
            HStack {
                Text(model.title)
                    .font(.caption)
                    .colorMultiply(.black)
                    .lineLimit(2)
                Text("\(model.size)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .frame(width: 80)
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
