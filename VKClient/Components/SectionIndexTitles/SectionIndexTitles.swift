//
//  SectionIndexTitle.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.09.2022.
//

import SwiftUI

struct SectionIndexTitles: View {
    let proxy: ScrollViewProxy
    let titles: [String]
    @GestureState private var dragLocation: CGPoint = .zero
    
    var body: some View {
        sectionIndexTitles
    }
}

private extension SectionIndexTitles {
    
    var sectionIndexTitles: some View {
        VStack {
            ForEach(titles, id: \.self) { title in
                Text(title)
                    .background(dragObserver(title: title))
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .updating($dragLocation) { value, state, _ in
                    state = value.location
                }
        )
    }
    
    func dragObserver(title: String) -> some View {
        GeometryReader { geometry in
            dragObserver(geometry: geometry, title: title)
        }
    }
    
    func dragObserver(geometry: GeometryProxy, title: String) -> some View {
        if geometry.frame(in: .global).contains(dragLocation) {
            DispatchQueue.main.async {
                withAnimation {
                    proxy.scrollTo(title, anchor: .top)
                }
            }
        }
        return Rectangle().fill(Color.clear)
    }
}

//struct SectionIndexTitles_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionIndexTitle()
//    }
//}
