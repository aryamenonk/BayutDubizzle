//
//  DashboardRouterTests.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle

class DashboardRouterTests: XCTestCase {
    
    var dashboardRouter: DashboardRouter!
    var navigationController: MockNavigationController!
    var product: Product!
    
    override func setUpWithError() throws {
        dashboardRouter = DashboardRouter()
        product = MockDashboardData.shared.products.first
    }
    
    func testDisplayDetailsPage() {
        navigationController = MockNavigationController().getNavigationController(for: DashboardRouter.createModule())
        dashboardRouter.displayProductDetailView(navigationController: navigationController, product: product)
        XCTAssert(navigationController!.pushedViewController!.isKind(of: ProductDetailsViewController.self))
    }
    
    func testConfigureDashBoardMoule() {
        let dashboardViewController = DashboardRouter.createModule()
        XCTAssert(dashboardViewController.isKind(of: DashboardViewController.self))
        XCTAssert(dashboardViewController.presenter != nil)
        XCTAssert(dashboardViewController.presenter?.view != nil)
        XCTAssert(dashboardViewController.presenter?.interactor != nil)
        XCTAssert(dashboardViewController.presenter?.router != nil)
    }
    
    override func tearDownWithError() throws {
        dashboardRouter = nil
        navigationController = nil
        product = nil
        
    }
}
