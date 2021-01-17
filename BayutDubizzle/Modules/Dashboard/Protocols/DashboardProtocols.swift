//
//  DashboardProtocols.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 13/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation
import UIKit

// protocol to handle interaction from view to presenter
protocol ViewToPresenterDashboardProtocol {
    var view: PresenterToViewDashboardProtocol? {get set}
    var interactor: PresenterToInteractorDashboardProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    var products: [Product]? {get set}
    
    func fetchAllProducts()
    func displayProductDetail(navigationController: UINavigationController, forProductAt index: Int)
}

// protocol to handle interaction from presenter to view
protocol PresenterToViewDashboardProtocol: class {
    func displayProducts(products: [ProductViewModel])
    func displayError(error: Error)
    func dismissLoader()
}

// protocol to handle interaction from presenter to interactor
protocol PresenterToInteractorDashboardProtocol {
    var presenter: InteractorToPresenterDashboardProtocol? {get set}
    func fetchProducts()
}

// protocol to handle interaction from interactor to presenter
protocol InteractorToPresenterDashboardProtocol: class {
    func onSuccessProductsFetch(products: [Product])
    func onFailedProductsFetch(error: Error)
    func onServerResponseReceival()
}

// protocol to handle navigation
protocol PresenterToRouterProtocol {
    static func createModule() -> DashboardViewController
    func displayProductDetailView(navigationController: UINavigationController,  product: Product)
}
