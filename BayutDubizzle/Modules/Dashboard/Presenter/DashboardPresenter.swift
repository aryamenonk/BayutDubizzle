//
//  DashboardPresenter.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 13/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation
import UIKit

class DashboardPresenter: ViewToPresenterDashboardProtocol {
    
    var products: [Product]?
    
    weak var view: PresenterToViewDashboardProtocol?
    
    var interactor: PresenterToInteractorDashboardProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func fetchAllProducts() {
        interactor?.fetchProducts()
    }
    
    func displayProductDetail(navigationController: UINavigationController, forProductAt index: Int) {
        guard let selectedProduct = products?[index] else { return }
        router?.displayProductDetailView(navigationController: navigationController, product: selectedProduct)
    }
    
}

extension DashboardPresenter: InteractorToPresenterDashboardProtocol {
    func onSuccessProductsFetch(products: [Product]) {
        self.products = products
        var productViewModels = [ProductViewModel]()
        
        for product in products {
            let productViewModel: ProductViewModel = ProductViewModel(title: product.name, price: product.price, imageUrlString: product.imageUrlsThumbnails?.first)
            productViewModels.append(productViewModel)
        }
        view?.dismissLoader()
        view?.displayProducts(products: productViewModels)
    }
    
    func onFailedProductsFetch(error: Error) {
        view?.dismissLoader()
        view?.displayError(error: error)
    }
    
    func onServerResponseReceival() {
        
    }
}
