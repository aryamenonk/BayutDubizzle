//
//  DashboardRouter.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 13/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation
import UIKit

class DashboardRouter: PresenterToRouterProtocol {
    static func createModule() -> DashboardViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DashboardViewController.identifier) as? DashboardViewController else { return DashboardViewController() }
        
        var presenter: ViewToPresenterDashboardProtocol & InteractorToPresenterDashboardProtocol = DashboardPresenter()
        var interactor: PresenterToInteractorDashboardProtocol = DashboardInteractor()
        let router: PresenterToRouterProtocol = DashboardRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func displayProductDetailView(navigationController: UINavigationController,  product: Product) {
        let productDetailModule = ProductDetailRouter.createModule(with: product)
        navigationController.pushViewController(productDetailModule, animated: true)
    }
}
