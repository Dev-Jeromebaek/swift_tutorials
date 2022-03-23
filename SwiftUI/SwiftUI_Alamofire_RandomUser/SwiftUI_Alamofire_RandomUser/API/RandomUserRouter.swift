//
//  RandomUserRouter.swift
//  SwiftUI_Alamofire_RandomUser
//
//  Created by 백승엽 on 2022/03/23.
//

import Foundation
import Alamofire

// https://randomuser.me/api/?page=3&results=10&seed=abc
let BASE_URL = "https://randomuser.me/api/"

enum RandomUserRouter: URLRequestConvertible{
    
    case getUsers(page: Int = 1, results: Int = 20)
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var endPoint : String {
        switch self {
        case .getUsers:
            return ""
        default:
            return ""
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .getUsers: return .get
        default:        return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case let .getUsers(page, results):
            var params = Parameters()
            params["page"] = page
            params["results"] = results
            params["seed"] = "seungyeub"
            return params
        default: return Parameters()
        }
    }
     
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .getUsers:
            request = try URLEncoding.default.encode(request, with: parameters)
        default:
            return request
        }
        
        return request
        
    }
    
}
