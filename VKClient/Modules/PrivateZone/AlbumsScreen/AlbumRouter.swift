//
//  AlbumRouter.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation

protocol AlbumRouter {
    func goToPhotos(albumId: String)
}

extension AlbumsCoordinator: AlbumRouter {
    func goToPhotos(albumId: String) {
        self.route(to: \.photos, albumId)
    }
}
