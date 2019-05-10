//
//  Entry+CoreDataProperties.swift
//  Travel
//
//  Created by Austin Terranova on 5/10/19.
//  Copyright © 2019 Austin Terranova. All rights reserved.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var name: String?
    @NSManaged public var travels: Travel?

}
