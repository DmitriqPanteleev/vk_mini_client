//
//  ImgCache.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 14.08.2022.
//

import SwiftUI
import Kingfisher

struct NetworkImage: SwiftUI.View {
    
    @State private var image: UIImage? = nil
    
    var frameWidth: CGFloat?
    var frameHeight: CGFloat?
    var radius: CGFloat?
    
    let imageURL: URL?
    let isAnimation: Bool
    
    init(imageURL: URL?,
         isAnimation: Bool = true
    ) {
        self.imageURL = imageURL
        self.isAnimation = isAnimation
    }
    
    // initializer to set width and height of frame
    init(imageURL: URL?,
         isAnimation: Bool = true,
         frameWidth: CGFloat?,
         frameHeight: CGFloat?,
         radius: CGFloat?
    ) {
        self.imageURL = imageURL
        self.isAnimation = isAnimation
        self.frameWidth = frameWidth
        self.frameHeight = frameHeight
        self.radius = radius
    }
    
    var body: some SwiftUI.View {
        Image(uiImage: image ?? UIImage(systemName: "eye.slash")!) // TODO: Unwrap nil
            .resizable()
            .frame(width: self.frameWidth ?? 50, height: self.frameHeight ?? 50)
            .scaledToFit()
            .cornerRadius(self.radius ?? 50)
//            .if(!isAnimation, transform: { TODO: ????
//                $0.animation(nil)
//            })
            .onAppear {
                withAnimation {
                    loadImage()
                }
            }
    }
    
    private func loadImage() {
        guard let imageURL = imageURL, image == nil else { return }
        KingfisherManager.shared.retrieveImage(with: imageURL) { result in
            switch result {
            case .success(let imageResult):
                self.image = imageResult.image
            case .failure:
                break
            }
        }
    }
}
