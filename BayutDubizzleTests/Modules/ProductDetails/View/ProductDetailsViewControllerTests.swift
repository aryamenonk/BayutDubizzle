//
//  ProductDetailsViewControllerTests.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle

class ProductDetailsViewControllerTests: XCTestCase {
    
    var viewController: ProductDetailsViewController?
    var presenter: MockPresenter?

    override func setUpWithError() throws {
        viewController = ProductDetailRouter.createModule(with: MockDashboardData.shared.products.first!)
        presenter = MockPresenter()
        viewController?.presenter = presenter
        _ = viewController?.view
    }

    override func tearDownWithError() throws {
        viewController = nil
        presenter = nil
    }

    func testViewLoad() {
        presenter?.displayDetail()
        XCTAssert(presenter!.didDisplayDetail)
    }
    
    func testDisplayData() {
        viewController?.presenter?.product =  MockDashboardData.shared.products.first
        viewController?.displayDetailForProduct(product: (viewController?.presenter?.product)!)
        XCTAssert(!viewController!.nameLabel!.text!.isEmpty)
        XCTAssert(!viewController!.priceLabel!.text!.isEmpty)
    }
}

extension ProductDetailsViewControllerTests {
    
    class MockPresenter : ViewToPresenterProductDetailProtocol {
        
        var product: Product?
        
        var view: PresenterToViewProductDetailProtocol?
        var didDisplayDetail = false
        
        func displayDetail() {
            didDisplayDetail = true
        }
    }
}
