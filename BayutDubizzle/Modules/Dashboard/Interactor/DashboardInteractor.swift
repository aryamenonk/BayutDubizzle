//
//  DashboardInteractor.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 13/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation

class DashboardInteractor: PresenterToInteractorDashboardProtocol {
    weak var presenter: InteractorToPresenterDashboardProtocol?
    
    func fetchProducts() {
        Product.fetchProducts { [weak self] (response) in
            guard let welf = self else { return }
            
            switch response {
            case .success(let products):
                // send events to presenter
                welf.presenter?.onSuccessProductsFetch(products: products)
                
            case .failure(let error):
                welf.presenter?.onFailedProductsFetch(error: error)
            }
            welf.presenter?.onServerResponseReceival()
        }
    }
}
