//
//  BayutDubizzleUITests.swift
//  BayutDubizzleUITests
//
//  Created by Arya Menon K on 12/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest

class BayutDubizzleUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let myTable = app.tables.matching(identifier:  "tableView" )
        let loadingLabel = myTable.cells.element(matching: .cell, identifier: "'Loading...")
        XCTAssert(loadingLabel.exists)
        
        let cell = myTable.cells.element(matching: .cell, identifier: "ProductDetailsCell" + "0")

        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: cell, handler: nil)
        waitForExpectations(timeout: 20, handler: nil)
        
        cell.tap()
        
        XCTAssert(app.staticTexts["Name:"].exists)
        XCTAssert(app.staticTexts["Price:"].exists)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
