//
//  Product.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 12/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation

enum ProductServiceModule : ServiceModule {
    case allProducts
    
    var module: Module? {
        return .allProducts
    }
}

class Product: Codable {
    let createdAt: String?
    let price : String?
    let name : String?
    let uid : String?
    let imageUrls: [String]?
    let imageUrlsThumbnails: [String]?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price
        case name
        case uid
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
    
    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        price = try container.decodeIfPresent(String.self, forKey: .price)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        imageUrls = try container.decodeIfPresent([String].self, forKey: .imageUrls)
        imageUrlsThumbnails = try container.decodeIfPresent([String].self, forKey: .imageUrlsThumbnails)
        uid = try container.decodeIfPresent(String.self, forKey: .uid)
    }
    
    class func fetchProducts(completion: @escaping GenericResultClosure<[Product]>) {
        ServiceManager.shared.request(wrapper: ServiceWrapper(module: ProductServiceModule.allProducts)) { (result:Result<ProductAPIResponse>) in
            switch result {
            case .success(let response):
                completion(.success(response.results ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

class ProductAPIResponse: Codable {
    let results: [Product]?
}
