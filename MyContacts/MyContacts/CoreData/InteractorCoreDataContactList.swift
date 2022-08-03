//
//  UIView+Extension.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 31/7/22.
//

import Foundation
import CoreData

/// Create records in core data.
func createRecord(id : String, firstName : String, lastName: String)  {
    let data = Contact(context: persistenceManager.shared.context)
    data.id = id
    data.firstName  = firstName
    data.lastName = lastName
    do{
        try persistenceManager.shared.context.save()
    }catch
    {
        print(error)
    }
}

/// Fetch the records from core data.
func getRecord() -> [Contact] {
    var data = [Contact]()
    do{
        data = try persistenceManager.shared.context.fetch(Contact.fetchRequest()) as [Contact]
    }catch
    {
        print(error)
    }
    return data
}

