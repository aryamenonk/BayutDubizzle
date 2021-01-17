//
//  ProductDetailRouter.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 16/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailRouter {
    
    static func createModule(with product: Product) -> ProductDetailsViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ProductDetailsViewController.identifier) as? ProductDetailsViewController else { return ProductDetailsViewController() }
        
        var presenter: ViewToPresenterProductDetailProtocol = ProductDetailPresenter()
        presenter.product = product
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
}
