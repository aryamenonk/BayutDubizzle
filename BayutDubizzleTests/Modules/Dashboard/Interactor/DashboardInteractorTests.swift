//
//  DashboardInteractorTests.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle

class DashboardInteractorTests: XCTestCase {

    var presenter: MockPresenter!
    var interactor: DashboardInteractor!
    
    override func setUpWithError() throws {
        interactor = DashboardInteractor()
        presenter = MockPresenter()
        interactor.presenter = presenter

    }

    override func tearDownWithError() throws {
        presenter = nil
        interactor = nil
    }

    func testProductFetch() throws {
        XCTAssert(presenter!.mockProducts.isEmpty, "Should set products")
        interactor.fetchProducts()
    }
}

extension DashboardInteractorTests {
    class MockPresenter: InteractorToPresenterDashboardProtocol {
        var mockProducts = [Product]()
        var error: Error?
        var didonServerResponseReceival = false
        
        func onSuccessProductsFetch(products: [Product]) {
            mockProducts = MockDashboardData.shared.products
        }
        
        func onFailedProductsFetch(error: Error) {
            self.error = error
        }
        
        func onServerResponseReceival() {
            didonServerResponseReceival = true
        }
    }
}
