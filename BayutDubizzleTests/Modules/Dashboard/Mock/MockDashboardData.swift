//
//  MockDashboardData.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation
@testable import BayutDubizzle

class MockDashboardData {
    var products = [Product]()
    static var shared = MockDashboardData()
    
    private init() {
        
        let data = loadDataFromBundle(withName: "DashboardMockDataJson", extension: "json")
        
        let decodedObject = try? JSONDecoder().decode(ProductAPIResponse.self, from: data)
        self.products = decodedObject!.results!
    }
    
    func loadDataFromBundle(withName name: String, extension: String) ->  Data {
        let bundle =  Bundle.main
        let url = bundle.url(forResource: name, withExtension: `extension`)
        let data = try! Data(contentsOf: url!)
        return data
    }
}
