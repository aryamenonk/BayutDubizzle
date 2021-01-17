//
//  DashboardViewController.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 13/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    var presenter: ViewToPresenterDashboardProtocol?

    var dashboardData = [ProductViewModel]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        presenter?.fetchAllProducts()
    }

    func configureTableView() {
        tableView?.accessibilityIdentifier = "tableView"

        registerCell()
        showLoader()
    }

    func showLoader() {
        let backgroundViewLabel = UILabel()
        backgroundViewLabel.text = "Loading..."
        backgroundViewLabel.font = UIFont.systemFont(ofSize: 32)
        backgroundViewLabel.textAlignment = .center
        tableView.backgroundView = backgroundViewLabel
    }

    private func registerCell() {
        tableView?.register(UINib(nibName: ProductDetailsCell.identifier, bundle: nil), forCellReuseIdentifier: ProductDetailsCell.identifier)
    }
}

// Tableview delegates
extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: ProductDetailsCell.identifier, for: indexPath) as? ProductDetailsCell else { return UITableViewCell() }
        productCell.configureView(product: dashboardData[indexPath.row])
        productCell.isAccessibilityElement = true
        productCell.accessibilityIdentifier = ProductDetailsCell.identifier + indexPath.row.description
        return productCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigation = navigationController else { return }
        presenter?.displayProductDetail(navigationController: navigation, forProductAt: indexPath.row)
    }
}

extension DashboardViewController: PresenterToViewDashboardProtocol {
    func displayProducts(products: [ProductViewModel]) {
        dashboardData = products
    }

    func displayError(error: Error) {
        showOkAlert(message: error.localizedDescription)
        tableView.backgroundView = nil
    }

    func dismissLoader() {
        tableView.backgroundView = nil
    }
}
