//
//  ViewController.swift
//  Project12
//
//  Created by João Victor on 22/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        //defaults.set(25, forKey: "Age")
        defaults.set("Dark", forKey: "Theme")
        defaults.set(true, forKey: "useFaceID")
        
        let age = UserDefaults.standard.integer(forKey: "Age")
        print(age)
    }


}

