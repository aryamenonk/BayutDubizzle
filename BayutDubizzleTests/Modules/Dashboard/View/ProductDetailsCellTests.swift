//
//  ProductDetailsCellTests.swift
//  BayutDubizzleTests
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import XCTest
@testable import BayutDubizzle


class ProductDetailsCellTests: XCTestCase {
    var cell : ProductDetailsCell!

    override func setUpWithError() throws {
        let tableView = UITableView()
        tableView.register(UINib(nibName: ProductDetailsCell.identifier, bundle: nil), forCellReuseIdentifier: ProductDetailsCell.identifier)
        cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailsCell.identifier) as? ProductDetailsCell
    }

    override func tearDownWithError() throws {
        cell = nil
    }
    
    func testDisplayContents() {
        // This is an example of a functional test case.
        let product = MockDashboardData.shared.products.first!
        let viewModel = ProductViewModel(title: product.name, price: product.price, imageUrlString: product.imageUrlsThumbnails!.first ?? "")
        cell.configureView(product: viewModel)
        
        XCTAssert(!cell.titleLabel!.text!.isEmpty)
        XCTAssert(!cell.priceLabel!.text!.isEmpty)
    }
}
