//
//  ProductDetailProtocols.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 16/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation

protocol ViewToPresenterProductDetailProtocol {
    var view: PresenterToViewProductDetailProtocol? {get set}
    var product: Product? {get set}
    
    func displayDetail()
}

protocol PresenterToViewProductDetailProtocol {
    func displayDetailForProduct(product: Product)
}
