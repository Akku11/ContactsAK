//
//  ContactListResponseModel.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 2/8/22.
//

import Foundation

 struct ContactResponse: Codable {
   var data: [DataList]
  
  enum CodingKeys: String, CodingKey {
    case data = "data"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    data = try values.decodeIfPresent([DataList].self, forKey: .data) ?? []
  }
}

struct DataList: Codable, Equatable {
  var id: Int
  var email: String
  var firstName: String
  var lastName: String
  var avatar: String
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case email = "email"
    case firstName = "first_name"
    case lastName = "last_name"
    case avatar = "avatar"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
    email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
    firstName = try values.decodeIfPresent(String.self, forKey: .firstName) ?? ""
    lastName = try values.decodeIfPresent(String.self, forKey: .lastName) ?? ""
    avatar = try values.decodeIfPresent(String.self, forKey: .avatar) ?? ""
  }
}

