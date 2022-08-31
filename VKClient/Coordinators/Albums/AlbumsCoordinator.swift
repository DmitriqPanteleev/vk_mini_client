//
//  AlbumsCoordinator.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 21.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class AlbumsCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AlbumsCoordinator.start)
    
    @Root var start = makeStart
    @Route(.push) var photos = makePhotoView
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}


extension AlbumsCoordinator {
    
    @ViewBuilder func makeStart() -> some View {
        let viewModel = AlbumListViewModel(router: self)
        AlbumListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makePhotoView(albumId: String) -> some View {
        let viewModel = PhotosViewModel(router: self)
        PhotosView(albumId: albumId, viewModel: viewModel)
    }
}

