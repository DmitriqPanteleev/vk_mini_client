//
//  AuthWebView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import SwiftUI

struct AuthWebView: View {
    
    @StateObject var viewModel = AuthWebViewModel()
    
    var body: some View {
        if viewModel.output.showFriends {
            FriendListView()
        } else {
            webView
        }
    }
}


private extension AuthWebView {
    @ViewBuilder var webView: some View{
        if let url = viewModel.url{
            WebViewRepresentable(url: url,
                                 onError: { error in
                                    print(error.description)
                                },
                                 onComplited: viewModel.input.onComplitedWebView)
        }
    }
}

struct AuthWebView_Previews: PreviewProvider {
    static var previews: some View {
        AuthWebView()
    }
}
