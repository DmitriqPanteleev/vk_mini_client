//
//  AuthCoordinator.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class AuthCoordinator:NavigationCoordinatable {
    var stack = NavigationStack(initial: \AuthCoordinator.start)
    
    @Root var start = makeStart
    
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

private extension AuthCoordinator {
    @ViewBuilder func makeStart() -> some View {
        AuthWebView()
    }
}
