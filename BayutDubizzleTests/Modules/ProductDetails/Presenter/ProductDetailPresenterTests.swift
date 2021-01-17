//
//  ProductDetailPresenterTests.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle

class ProductDetailPresenterTests: XCTestCase {

    var presenter: ProductDetailPresenter!
    var product: Product?
    var mockView: MockView!

    override func setUpWithError() throws {
        self.presenter = ProductDetailPresenter()
        self.mockView = MockView()
        self.presenter?.view = self.mockView
        self.product = MockDashboardData.shared.products.first!
        self.presenter.product = product
        self.presenter.displayDetail()
    }

    override func tearDownWithError() throws {
        presenter = nil
        product = nil
        mockView = nil
    }

    func testProductDetailsDisplay()  {
        self.presenter.displayDetail()
        XCTAssert(self.mockView.product!.name == product!.name)
        XCTAssert(self.mockView.product!.price == product!.price)
    }
}

extension ProductDetailPresenterTests {
    class MockView: PresenterToViewProductDetailProtocol {
        var product: Product?
        
        func displayDetailForProduct(product: Product) {
            self.product = product
        }
    }
}
