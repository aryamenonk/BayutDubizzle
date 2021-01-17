//
//  AlertTest.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle

class AlertTest: XCTestCase {
    var viewController: UIViewController!
    
    override func setUpWithError() throws {
        viewController = MockAlert.topMostViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        viewController.showOkAlert(message: "Test") {
            XCTAssert(self.viewController.presentedViewController!.isKind(of: MockAlert.self))
        }
    }
}

extension AlertTest {
    class MockAlert : Alert {
        class func topMostViewController() -> UIViewController {
            if let vc =  MockNavigationController().topViewController {
                return vc
            }
            
            let vc = UIViewController()
            _ = MockNavigationController().getNavigationController(for: vc)
            _ = vc.view
            return vc
        }
    }
}

