//
//  RepresentableWebViewExt.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import Foundation
import WebKit

extension WKWebView {
    func load(_ url: URL?, onError: (CustomURLError) -> Void) {
        guard let url = url else {
            return onError(.invalidError)
        }
        load(.init(url: url))
    }
}
