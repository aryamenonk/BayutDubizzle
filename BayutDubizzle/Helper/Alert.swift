//
//  Alert.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 16/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import UIKit
typealias VoidClosure = (() -> Void)

class Alert: UIAlertController {
    class func ok(message: String? = nil ,completion: VoidClosure? = nil) -> UIAlertController {
        let finalMessage = (message ?? "").isEmpty ? "This service you are trying to connect to is not responding at the moment, please try again later." : message
        let alertview = UIAlertController(title: "Sorry!", message: finalMessage, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            completion?()
        }
        alertview.addAction(okButton)
        return alertview
    }
}

