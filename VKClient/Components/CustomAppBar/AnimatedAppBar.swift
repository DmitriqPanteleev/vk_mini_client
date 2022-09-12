//
//  AnimatedAppBar.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 11.09.2022.
//

import SwiftUI
import simd

struct AnimatedAppBar: View {
    
    let style: AnimatedAppBarStyle
    
    private let expandedHeight: CGFloat = 300
    private let foldedHeight: CGFloat = 100
    private let expandedPadding: CGFloat = 50
    private let foldedPadding: CGFloat = 16
    
    var body: some View {
        headerView
    }
}

private extension AnimatedAppBar {
    var headerView: some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("header")).minY
            let size = proxy.size
            let height = (size.height + minY)
            
            Image("whitePattern")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: height, alignment: .top)
                .overlay {
                    ZStack(alignment: .bottom) {
                        LinearGradient(colors: [.clear, .white.opacity(height)], startPoint: .top, endPoint: .bottom)
                        headerBackground(opacity: height)
                            
                    }
                }
                .cornerRadius(15)
                .offset(y: -minY)
            
        }
        .frame(height: 200)
    }
    
    @ViewBuilder func headerBackground(opacity: CGFloat) -> some View {
        VStack {
            Text("Мои группы")
                .font(.system(size: opacity / 10))
                .foregroundColor(.black.opacity(opacity / 12))
            style.subtitle
                .foregroundColor(.clear.opacity(opacity))
        }
        .padding(.vertical, 20)
    }
}

struct AnimatedAppBar_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedAppBar(style: .forGroups)
    }
}
