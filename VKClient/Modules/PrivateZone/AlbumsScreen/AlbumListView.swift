//
//  AlbumListView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel: AlbumListViewModel
    
    var body: some View {
        VStack {
            tableView
            Divider()
            Spacer()
        }
        .onAppear(perform: onAppearSend)
        .navigationBarHidden(true)
    }
}

private extension AlbumListView {
    var tableView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(viewModel.output.albumList) { model in
                    AlbumCellView(model: model)
                        .onTapGesture {
                            routeToAlbum(id: model.id)
                        }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
    
//    @ViewBuilder var photosFromPage: some View {
//
//    }
}

private extension AlbumListView {
    func onAppearSend() {
        viewModel.input.onAppear.send()
    }
    
    func routeToAlbum(id: Int) {
        viewModel.input.onCellTap.send(id)
    }
}

//struct AlbumListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumListView()
//    }
//}
