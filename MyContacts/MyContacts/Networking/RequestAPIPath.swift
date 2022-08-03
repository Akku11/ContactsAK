//
//  RequestAPIPath.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 31/7/22.
//

import Foundation

//MARK:- API URL
struct Config {
  static let base = "https://reqres.in"
  static var timeoutInterval: TimeInterval = 60
}

enum APIPath: String {
  case users = "/api/users"

  static func url(api: APIPath) -> String {
    return  Config.base + api.rawValue
  }
}

public enum HTTPMethod: String, Encodable {
  case GET = "GET"
  case POST = "POST"
}
