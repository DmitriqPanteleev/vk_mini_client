//
//  SwiftUIView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 21.08.2022.
//

import SwiftUI

struct PhotosView: View {
    
    let albumId: String
    @StateObject var viewModel: PhotosViewModel
    
    var body: some View {
        VStack {
            photoGrid
        }
        .padding(.horizontal)
        .onAppear {
            onAppearSend(id: albumId)
        }
    }
}

private extension PhotosView {
    @ViewBuilder var photoGrid: some View {
        
        let gridItems: [GridItem] = Array(repeating: .init(.fixed(100)), count: 3)
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItems, alignment: .center, spacing: 10) {
                ForEach(viewModel.output.photos) { model in
                    PhotoCellView(model: model)
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
