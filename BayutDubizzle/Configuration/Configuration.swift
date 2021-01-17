//
//  Configuration.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 16/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation

class Configuration {
    
    // the current singleton configuration
    static let current = Configuration()
    
    // all configurations
    private var all = [String: Any]()
    
    private init() {
        
        // load all configurations
        all = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? [String: Any] ?? [:]
        
        if let urlString = all["baseUrl"] as? String {
            baseUrl = URL(string: urlString)
        } else {
            baseUrl = nil
        }
    }
    
    // protocol (http, https)
    let baseUrl: URL?
}
