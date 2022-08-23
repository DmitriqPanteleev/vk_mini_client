//
//  AlbumListView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject private var viewModel = AlbumListViewModel()
    
    var body: some View {
        VStack {
            appBar()
            tableView()
        }
    }
}

extension AlbumListView {
    
    @ViewBuilder func appBar() -> some View {
        HStack {
            // вынести в отдельный компонент
            Text("Мои альбомы")
                .font(.largeTitle)
                .onAppear(perform: onAppearSend)
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder func tableView() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.output.albumList) { model in
                Button(action: routeToAlbum) {
                    AlbumCellView(model: model)
                }
                .onTapGesture {
                    viewModel.input.onCellTap.send(model.id)
                }
            }
        }
    }
}

private extension AlbumListView {
    func onAppearSend() {
        viewModel.input.onAppear.send()
    }
    
    func routeToAlbum() {
        
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
