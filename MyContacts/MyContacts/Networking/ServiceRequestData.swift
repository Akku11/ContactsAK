//
//  ServiceRequestData.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 31/7/22.
//

import Foundation
//MARK: create request model and parameters
struct RequestData {
  static func createRequest(method: HTTPMethod,
                            url: URL,
                            httpBody: [AnyHashable: Any]?,
                            headerData: [String: String]?,
                            timeoutInterval: TimeInterval = Config.timeoutInterval
  ) -> NSMutableURLRequest {
    let theRequest = NSMutableURLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: timeoutInterval)
    theRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    theRequest.httpMethod = method.rawValue
    theRequest.httpBody = RequestData.parameters(httpBody)
    if let headers = headerData {
      for (key, value) in headers {
        theRequest.addValue(value, forHTTPHeaderField: key)
      }
    }
    return theRequest
  }
  
  static func parameters(_ parameters: [AnyHashable: Any]?) -> Data? {
    if let httpParams = parameters,let postData = try? JSONSerialization.data(withJSONObject: httpParams, options: []) {
      return postData
    }
    return nil
  }
}
