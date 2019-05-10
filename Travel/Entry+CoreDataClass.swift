//
//  Entry+CoreDataClass.swift
//  Travel
//
//  Created by Austin Terranova on 5/10/19.
//  Copyright © 2019 Austin Terranova. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Entry)
public class Entry: NSManagedObject {
    var modifiedDate: Date? {
        get {
            return rawModifiedDate as Date?
        }
        set {
            rawModifiedDate = newValue as NSDate?
        }
    }
    
    var realImage: UIImage? {
        get {
            if let imageData = image as Data? {
                return UIImage(data: imageData)
            } else {
                return nil
            }
        }
        set {
            if let newImage = newValue {
                image = convertImageToNSData(image: newImage)
            }
        }
    }
    
    convenience init?(name: String?, content: String?, modifiedDate: Date?, image: UIImage?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate  //UIKit is needed to access UIApplication
        guard let managedContext = appDelegate?.persistentContainer.viewContext,
            let name = name, name != "" else {
                return nil
        }
        self.init(entity: Entry.entity(), insertInto: managedContext)
        self.name = name
        self.content = content
        self.modifiedDate = modifiedDate
        self.realImage = image
        
    }
}

func convertImageToNSData(image: UIImage) -> NSData? {
    // The image data can be represented as PNG or JPEG data formats.
    // Both ways to format the image data are listed below and the JPEG version is the one being used.
    
    //return image.jpegData(compressionQuality: 1.0) as NSData?
    return processImage(image: image).pngData() as NSData?
}

func processImage(image: UIImage) -> UIImage {
    if (image.imageOrientation == .up) {
        return image
    }
    
    UIGraphicsBeginImageContext(image.size)
    
    image.draw(in: CGRect(origin: CGPoint.zero, size: image.size), blendMode: .copy, alpha: 1.0)
    let copy = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    guard let unwrappedCopy = copy else {
        return image
    }
    
    return unwrappedCopy
}


