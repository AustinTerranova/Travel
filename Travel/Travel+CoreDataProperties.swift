//
//  Travel+CoreDataProperties.swift
//  Travel
//
//  Created by Austin Terranova on 5/10/19.
//  Copyright © 2019 Austin Terranova. All rights reserved.
//
//

import Foundation
import CoreData


extension Travel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Travel> {
        return NSFetchRequest<Travel>(entityName: "Travel")
    }

    @NSManaged public var content: String?
    @NSManaged public var name: String?
    @NSManaged public var rawModifiedDate: NSDate?
    @NSManaged public var size: Int64
    @NSManaged public var entry: NSSet?

}

// MARK: Generated accessors for entry
extension Travel {

    @objc(addEntryObject:)
    @NSManaged public func addToEntry(_ value: Entry)

    @objc(removeEntryObject:)
    @NSManaged public func removeFromEntry(_ value: Entry)

    @objc(addEntry:)
    @NSManaged public func addToEntry(_ values: NSSet)

    @objc(removeEntry:)
    @NSManaged public func removeFromEntry(_ values: NSSet)

}
