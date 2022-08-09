//
//  Provider.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import Foundation
import Moya

final class Provider<P>: MoyaProvider<P> where P: TargetType {

    convenience init() {
        let endpointClosure = { (target: P) -> Endpoint in
            let defaultEndpointMapping = MoyaProvider
                .defaultEndpointMapping(for: target)
            
            return defaultEndpointMapping
        }
        let logger = NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: [.formatRequestAscURL, .errorResponseBody, .verbose]))
        
        let plugins: [PluginType] = [logger]
        
        self.init(endpointClosure: endpointClosure,
                  plugins: plugins)
    }
}
