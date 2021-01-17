//
//  ServiceManager.swift
//  UAB
//
//  Created by Sanu Sathyaseelan on 04/11/2019.
//  Copyright © 2019 Solutions 4 Mobility. All rights reserved.
//

import Foundation
import Alamofire

class ServiceManager {
 
    static let shared = ServiceManager()
    
    var manager: Alamofire.Session

    init() {
        manager = Alamofire.Session(configuration: URLSessionConfiguration.default)
    }
    
    func decode<T: Decodable>(request: URLRequest, completion: @escaping GenericClosure<Result<T>>) {
        manager.request(request).responseDecodable { (response: AFDataResponse<T>) in
            
            if let request = response.request {
                
                print("URL: ", request.url?.absoluteString ?? "No url string")
                print("Headers: ", request.allHTTPHeaderFields ?? [:])
                
                if let body = request.httpBody, let dataString = String(data: body, encoding: .utf8) {
                    print("Parametrs: ", dataString)
                }
            }
            
            if let data = response.data, let dataString = String(data: data, encoding: .utf8) {
                print("Response: ", dataString)
            }
            
            if let error = response.error {
                print("Error: ", error.localizedDescription)
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension ServiceManager: ServiceProtocol {
    
    func request<T: Decodable>(wrapper: ServiceWrapper, completion: @escaping GenericClosure<Result<T>>) {
        guard let request = wrapper.urlRequest else { return }
        decode(request: request, completion: completion)
    }
}

extension ServiceWrapper: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        
        ServiceManager.shared.manager.session.configuration.timeoutIntervalForRequest = timeoutIntervalForRequest
        
        var requestParams = parameters
        if let defaultParameters = defaultParameters {
            requestParams = defaultParameters.merging(parameters ?? [:]) { _, custom in custom }
        }
        
        var urlRequest = try URLRequest(url: url!, method: HTTPMethod(rawValue: method.rawValue))
        urlRequest.cachePolicy = cachePolicy
        return method == .get ? try Alamofire.URLEncoding.default.encode(urlRequest, with: requestParams) : try Alamofire.JSONEncoding.default.encode(urlRequest, with: requestParams)
    }
}

extension ServiceModule {
    
    var url: URL? {
        var baseUrl = Configuration.current.baseUrl
        if let module = module {
            baseUrl?.appendPathComponent("/\(module.rawValue)")
        }
        return baseUrl
    }
}
