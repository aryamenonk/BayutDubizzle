//
//  UIViewControllerExtension.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 16/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import UIKit

extension UIViewController {
    func showOkAlert(message: String,completion: VoidClosure? = nil) {
        let alert = Alert.ok(message: message, completion: completion)
        present(alert, animated: true, completion: completion)
    }
}
