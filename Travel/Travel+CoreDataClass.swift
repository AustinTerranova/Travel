//
//  Travel+CoreDataClass.swift
//  Travel
//
//  Created by Austin Terranova on 5/9/19.
//  Copyright © 2019 Austin Terranova. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Travel)
public class Travel: NSManagedObject {
    var modifiedDate: Date? {
        get {
            return rawModifiedDate as Date?
        }
        set {
            rawModifiedDate = newValue as NSDate?
        }
    }
    
    var entries: [Entry]? {
        return entry?.allObjects as? [Entry]
    }
    
    convenience init?(name: String?, content: String?, entry: [Entry]?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate  //UIKit is needed to access UIApplication
        guard let managedContext = appDelegate?.persistentContainer.viewContext,
            let name = name, name != "" else {
                return nil
        }
        self.init(entity: Travel.entity(), insertInto: managedContext)
        self.name = name
        self.content = content
        if let size = content?.count {
            self.size = Int64(size)
        } else {
            self.size = 0
        }
        
        self.modifiedDate = Date(timeIntervalSinceNow: 0)
        //self.entry = entry
    }
    
    func update(name: String, content: String?, entry: [Entry]?) {
        self.name = name
        self.content = content
        if let size = content?.count {
            self.size = Int64(size)
        } else {
            self.size = 0
        }
        
        self.modifiedDate = Date(timeIntervalSinceNow: 0)
    }
}


