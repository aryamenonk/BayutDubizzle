//
//  DashboardViewControllerTests.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle

class DashboardViewControllerTests: XCTestCase {
    
    var viewController: DashboardViewController?
    var presenter: MockPresenter?
    
    override func setUpWithError() throws {
        viewController = DashboardRouter.createModule()
        presenter = MockPresenter()
        viewController?.presenter = presenter
        _ = viewController?.view
    }
    
    override func tearDownWithError() throws {
        viewController = nil
        presenter = nil
    }
    
    func testDataDisplay() throws {
        XCTAssert(viewController!.tableView != nil, "Should have tableView")
    }
    
    func testNoData() {
        viewController?.dashboardData = []
        XCTAssert(viewController?.tableView.numberOfRows(inSection: 0) == 0, "Check show empty table view")
    }
    
    func testDisplayData() {
        var productViewModels = [ProductViewModel]()
        
        // map product model to view models
        for product in MockDashboardData.shared.products {
            let productViewModel = ProductViewModel(title: product.name, price: product.price, imageUrlString: product.imageUrlsThumbnails?.first ?? "")
            productViewModels.append(productViewModel)
        }
        
        viewController?.dashboardData = productViewModels
        
        XCTAssert(viewController!.tableView.numberOfRows(inSection: 0) == viewController!.dashboardData.count)
    }
}

extension DashboardViewControllerTests {
    
    class MockPresenter : ViewToPresenterDashboardProtocol {
        var products: [Product]?
        var didFetchAllProducts = false
        
        var view: PresenterToViewDashboardProtocol?
        var interactor: PresenterToInteractorDashboardProtocol?
        var router: PresenterToRouterProtocol?
        
        func fetchAllProducts() {
            didFetchAllProducts = true
        }
        
        func displayProductDetail(navigationController: UINavigationController, forProductAt index: Int) {
            products = MockDashboardData.shared.products
        }
    }
}
