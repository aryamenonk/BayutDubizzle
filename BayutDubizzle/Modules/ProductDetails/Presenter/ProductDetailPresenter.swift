//
//  ProductDetailPresenter.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 16/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation
class ProductDetailPresenter: ViewToPresenterProductDetailProtocol {
    
    var product: Product?

    var view: PresenterToViewProductDetailProtocol?
    
    func displayDetail() {
        guard let product = product else { return }
        view?.displayDetailForProduct(product: product)
    }
}
