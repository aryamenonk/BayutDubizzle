//
//  MockNavigation.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import UIKit

class MockNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
    
    func getNavigationController(for viewController: UIViewController) -> MockNavigationController {
        UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = navigationController
        return MockNavigationController(rootViewController: viewController)
    }
}
