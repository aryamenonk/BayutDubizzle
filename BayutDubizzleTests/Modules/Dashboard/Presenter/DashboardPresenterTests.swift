//
//  DashboardPresenterTests.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle

class DashboardPresenterTests: XCTestCase {
    
    var presenter: DashboardPresenter!
    var mockInteractor: MockInteractor!
    var mockRouter: MockRouter!
    var mockDashboardData: [Product]!
    var mockView: MockView!
    
    override func setUpWithError() throws {
        self.presenter = DashboardPresenter()
        self.mockRouter = MockRouter()
        self.presenter?.router = self.mockRouter
        
        self.mockInteractor = MockInteractor()
        self.mockInteractor.presenter = self.presenter
        self.presenter?.interactor = self.mockInteractor
        
        self.mockView = MockView()
        self.presenter?.view = self.mockView
        self.mockDashboardData = MockDashboardData.shared.products
    }
    
    func testDismissLoader() {
        self.presenter.fetchAllProducts()
        XCTAssert(self.mockView.shouldDismissLoader, "Should dismiss loader after fetch")
    }
    
    func testFetchSuccess() {
        self.mockInteractor.isSuccess = true
        self.presenter.fetchAllProducts()
        XCTAssert(self.mockView.shouldShowProducts, "Should display all products")
    }
    
    func testFetchFail() {
        self.mockInteractor.isSuccess = false
        self.presenter.fetchAllProducts()
        XCTAssert(!self.mockView.shouldShowProducts, "Should display nothing")
    }
    
    override func tearDownWithError() throws {
        presenter = nil
        mockInteractor = nil
        mockRouter = nil
        mockDashboardData = nil
        mockView = nil
    }
}

extension DashboardPresenterTests {
    class MockInteractor: PresenterToInteractorDashboardProtocol {
        let mockDashboardData = MockDashboardData.shared.products
        var isSuccess = true
        var presenter: InteractorToPresenterDashboardProtocol?
        
        func fetchProducts() {
            presenter?.onServerResponseReceival()
            
            if isSuccess {
                presenter?.onSuccessProductsFetch(products: mockDashboardData)
            } else {
                presenter?.onFailedProductsFetch(error: NSError(domain: "test error", code: 123, userInfo: nil))
            }
        }
    }
    
    class MockRouter: PresenterToRouterProtocol {
        
        var product : Product?
        
        static func createModule() -> DashboardViewController {
            return DashboardRouter.createModule()
        }
        
        func displayProductDetailView(navigationController: UINavigationController, product: Product) {
            self.product = product
        }
    }
    
    class MockView: PresenterToViewDashboardProtocol {

        var shouldShowProducts = false
        var shouldDismissLoader = false
        var shouldShowError = false
        
        func displayProducts(products: [ProductViewModel]) {
            shouldShowProducts = true
            
        }
        
        func displayError(error: Error) {
            shouldShowError = true
        }
        
        func dismissLoader() {
            shouldDismissLoader = true
        }
    }
}
