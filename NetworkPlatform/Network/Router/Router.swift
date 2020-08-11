//
//  Router.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import Alamofire

protocol BaseRouter: URLRequestConvertible {
    var apiUrl: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var bodyData: Data? { get }
}

enum Router: BaseRouter {
    
    case timeline(request: TimelineRequest)
    case photo(request: TimelineRequest)
    
    var method: Alamofire.HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var apiUrl: String {
        return "https://gorest.co.in/public-api"
    }
    
    var path: String {
        switch self {
        case .timeline:
            return "/albums"
        case .photo:
            return "/photos"
        }
    }
        
    var urlPath: String {
        return apiUrl + path
    }
    
    var bodyData: Data? {
        switch self {
        case .timeline(let request):
            return encodeable(model: request)
        case .photo(let request):
            return encodeable(model: request)
        }
    }
    
    func encodeable<T: Codable>(model: T) -> Data? {
        return try? JSONEncoder().encode(model)
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: urlPath)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 30
        if method == .get {
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: self.bodyData?.asDictionary())
        } else {
            urlRequest.httpBody = self.bodyData
            switch self {
            default:
                return try Alamofire.JSONEncoding.default.encode(urlRequest, with: nil)
            }
        }
    }
}
