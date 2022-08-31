//
//  SwiftUIView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 21.08.2022.
//

import SwiftUI

struct PhotosView: View {
    
    let albumId: String
    let viewModel: PhotosViewModel
    
    var body: some View {
        VStack {
            photoGrid
        }
        .navigationBarHidden(true)
        .onAppear {
            onAppearSend(id: albumId)
        }
    }
}

private extension PhotosView {
    @ViewBuilder var photoGrid: some View {
        
        let gridItems: [GridItem] = [GridItem(),
                                     GridItem(),
                                     GridItem()]
        
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItems, alignment: .center, spacing: 20) {
                ForEach(viewModel.output.photos) { model in
                    NetworkImage(imageURL: URL(string: model.minUrl)!,
                                 frameWidth: 100,
                                 frameHeight: 100,
                                 radius: 20)
                }
            }
        }
    }
}

private extension PhotosView {
    func onAppearSend(id: String) {
        viewModel.input.onAppear.send(id)
    }
}

//struct PhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosView()
//    }
//}
