//
//  ContactListService.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 2/8/22.
//

import Foundation

public final class ContactListViewModelRequest {
  var success : (() -> Void)?
  var error : ((_ errorMessage: String) -> Void)?
  
  var contactListResponse: ContactResponse?
  
  func requestContacts() {
    
    let request = RequestModel(resource: ContactRequest())
    
    request.request { [weak self] (contactData) in
      guard let this = self else { return }
      if let data = contactData {
        this.contactListResponse =  data
        this.success?()
      } else {
        this.error?("wrong username or password")
      }
    } onError: { err in
      self.error?(err?.localizedDescription ?? "wrong username or password")
    }
  }
}
