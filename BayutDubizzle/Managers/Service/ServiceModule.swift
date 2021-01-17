//
//  ServiceModule.swift
//  UAB
//
//  Created by Muhammed Azharudheen on 11/5/19.
//  Copyright © 2019 Solutions 4 Mobility. All rights reserved.
//

import Foundation
typealias Parameters = [String: Any]

protocol ServiceModule {
    var method: RequestMethod { get }
    var parameters: Parameters? { get }
    var module: Module? { get }
    var url: URL? { get }
}

extension ServiceModule {
    var method: RequestMethod { .get }
    var parameters: Parameters? { nil }
    var module: Module? { nil }
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Module: String {
    case allProducts = "default/dynamodb-writer"
}
