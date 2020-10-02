//
//  model.swift
//  myBook
//
//  Created by Ravi Thakur on 02/10/20.
//

import UIKit
import RealmSwift

class Book: Object {
    
    @objc var cityName = ""
    @objc var cityIntro = ""
    @objc var cityFam = ""
    @objc var cityImages: NSData?
    @objc var cityPrice = ""
    @objc var cityRating = 0.0
    
}
