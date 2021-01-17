//
//  ProductDetailsCell.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 13/01/2021.
//  Copyright © 2020 BayutDubizzle. All rights reserved.
//

import UIKit

struct ProductViewModel {
    let title: String?
    let price: String?
    let imageUrlString: String?
    
    var imageUrl : URL? {
        if let imageUrlString = imageUrlString {
            return URL(string: imageUrlString)
        }
        return nil
    }
}

class ProductDetailsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var iconImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isAccessibilityElement = true
    }
    
    func setImage(for url: URL?) {
        guard let url = url else { return }
        url.image { [weak self] (image) in
            guard let productImage = image else { return }
            self?.iconImageView?.image = productImage
        }
    }
    
    func configureView(product: ProductViewModel) {
        titleLabel?.text = product.title
        priceLabel?.text = product.price
        setImage(for: product.imageUrl)
    }
}
