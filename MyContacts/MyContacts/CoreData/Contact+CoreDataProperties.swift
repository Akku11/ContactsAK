//
//  Contact+CoreDataProperties.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 3/8/22.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var id: String?

}

extension Contact : Identifiable {

}
