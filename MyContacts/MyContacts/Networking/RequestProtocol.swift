//
//  Request.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 31/7/22.
//

import Foundation
//MARK: create API paramters and service request
protocol ServiceRequest: AnyObject {
  associatedtype ModelType
  func decodeData(_ data: Data) throws -> ModelType?
  func request(onSuccess: @escaping (ModelType?) -> Void, onError: @escaping (Error?) -> Void?)
}

protocol APIParameters {
  associatedtype ModelType: Decodable
  var httpBody: [AnyHashable: Any]? { get set }
  var queryItems: [URLQueryItem]? { get }
  var methodPath: String { get }
  var headerData: [String: String]? {get set}
  var requestType: HTTPMethod {get set}
}

extension APIParameters {
  var url: URL {
    var components = URLComponents(string: Config.base)!
    components.path = methodPath
    components.queryItems = queryItems
    return components.url!
  }
  var urlRequest: URLRequest {
    return RequestData.createRequest(method: requestType, url: url, httpBody: httpBody, headerData: headerData) as URLRequest
  }
}
