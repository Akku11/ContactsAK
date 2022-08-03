//
//  ContactListRequestModel.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 2/8/22.
//

import Foundation

public struct ContactRequest: APIParameters {
  var httpBody: [AnyHashable: Any]? = nil
  var queryItems: [URLQueryItem]? = nil
  var methodPath: String = APIPath.users.rawValue
  var headerData: [String: String]?
  var requestType: HTTPMethod = .GET
  typealias ModelType = ContactResponse
}
