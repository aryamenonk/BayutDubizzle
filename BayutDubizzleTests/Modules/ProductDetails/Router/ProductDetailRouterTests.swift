//
//  ProductDetailRouterTests.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle

class ProductDetailRouterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConfigureModule() throws {
        let productDetailViewController = ProductDetailRouter.createModule(with: MockDashboardData.shared.products.first!)
        XCTAssert(productDetailViewController.isKind(of: ProductDetailsViewController.self))
        XCTAssert(productDetailViewController.presenter != nil)
        XCTAssert(productDetailViewController.presenter?.view != nil)
    }
}
