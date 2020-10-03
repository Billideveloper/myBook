//
//  model.swift
//  myBook
//
//  Created by Ravi Thakur on 02/10/20.
//

import UIKit
import RealmSwift

class Book: Object {
    
    @objc dynamic var cityName = ""
    @objc dynamic var cityIntro = ""
    @objc dynamic var cityFam = ""
    @objc dynamic var cityImages: NSData?
    @objc dynamic var cityPrice = ""
    @objc dynamic var cityRating = 0.0
    
    
    
    
}
