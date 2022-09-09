//
//  PhotoCellView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 03.09.2022.
//

import SwiftUI

struct PhotoCellView: View {
    
    let model: PhotoModel
    
    var body: some View {
        VStack {
            NetworkImage(imageURL: URL(string: model.urls.last!),
                         frameWidth: 100,
                         frameHeight: 100,
                         radius: 10)
        }
    }
}

//struct PhotoCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoCellView(model: PhotoModel(id: 1, albumID: 1, date: 1, postID: 1, urls: ["https://sun9-east.userapi.com/sun9-31/s/v1/ig2/w4EQis4-THY7YEiZ5_mVJSyzspo8j1lfW125UOn3TQcVfeYbiO0Wj6ZYhalelHAddx2jtaXyZ2pgYY0ICXeug-x5.jpg?size=510x680&quality=95&type=album"], likes: 1, comments: 1, reposts: 1))
//    }
//}
