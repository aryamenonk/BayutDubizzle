//
//  ProductDetailsViewController.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 16/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    var presenter: ViewToPresenterProductDetailProtocol?

    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var nameLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Product Detail"
        presenter?.displayDetail()
    }
}

extension ProductDetailsViewController: PresenterToViewProductDetailProtocol {
    func displayDetailForProduct(product: Product) {
        nameLabel?.text = product.name
        priceLabel?.text = product.price
        dateLabel?.text = product.createdAt?.formattedDate(from: "yyyy-MM-dd HH:mm:ss.SSSSSS", to: "MMMM dd, yyyy")
        
        configureImage(for: product.imageUrls?.first)
    }
    
    func configureImage(for urlString: String?) {
        guard let urlString = urlString,let url = URL(string: urlString) else { return }
        url.image { [weak self] (image) in
            guard let productImage = image else { return }
            self?.imageView?.image = productImage
        }
    }    
}
