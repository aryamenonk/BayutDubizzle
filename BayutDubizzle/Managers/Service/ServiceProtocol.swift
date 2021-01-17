//
//  ServiceProtocol.swift
//  UAB
//
//  Created by Muhammed Azharudheen on 11/5/19.
//  Copyright © 2019 Solutions 4 Mobility. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

typealias GenericClosure<T> = (T) -> Void
typealias GenericResultClosure<T> = GenericClosure<Result<T>>

protocol ServiceProtocol {
    func request<T: Decodable>(wrapper: ServiceWrapper, completion: @escaping GenericClosure<Result<T>>)
}
