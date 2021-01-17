//
//  ServiceWrapper.swift
//  UAB
//
//  Created by Muhammed Azharudheen on 11/5/19.
//  Copyright © 2019 Solutions 4 Mobility. All rights reserved.
//

import Foundation

class ServiceWrapper {
    
    private (set) var serviceModule: ServiceModule
    
    var cachePolicy: URLRequest.CachePolicy {
        return URLRequest.CachePolicy.useProtocolCachePolicy
    }
    
    var timeoutIntervalForRequest: TimeInterval {
        return 60.0
    }
    
    init(module: ServiceModule) {
        serviceModule = module
    }
}

extension ServiceWrapper {
    
    var defaultParameters: Parameters? { nil }
    
    var parameters: Parameters? {
        serviceModule.parameters
    }
    
    var method: RequestMethod {
        serviceModule.method
    }
    
    var url: URL? {
        serviceModule.url
    }
}
