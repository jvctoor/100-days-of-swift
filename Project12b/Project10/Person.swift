//
//  Person.swift
//  Project10
//
//  Created by João Victor on 11/08/22.
//

import UIKit

class Person: NSObject, Codable {
    
    var name: String
    var image: String
    
    init(name: String, image:String) {
        self.name = name
        self.image = image
    }

}
