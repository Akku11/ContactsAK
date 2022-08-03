//
//  Request.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 2/8/22.
//

import Foundation

class RequestModel<Parameters: APIParameters>: ServiceRequest {
  var apiParameters: Parameters
  
  init(resource: Parameters) {
    self.apiParameters = resource
  }
  
  func request(onSuccess: @escaping(Parameters.ModelType?) -> Void, onError: @escaping (Error?) -> Void?) {
    let session = URLSession.init(configuration: URLSessionConfiguration.default)
    let task = session.dataTask(with: apiParameters.urlRequest, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
      guard let data = data else {
        onError(error)
        return
      }
      do {
        try onSuccess(self.decodeData(data))
      } catch let parsingError {
        print("Error", parsingError)
      }
    })
    task.resume()
  }
  
  func decodeData(_ data: Data) throws -> Parameters.ModelType? {
    let wrapper = try? JSONDecoder().decode(Parameters.ModelType.self, from: data)
    return wrapper
  }
}
