//
//  DetailViewController.swift
//  Project01
//
//  Created by João Victor on 23/03/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    var selectedImage: String?
    var pos: Int?
    var pictures = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imgView.image  = UIImage(named: imageToLoad)
        }
        
        if let position = pos {
            title = "\(position) of \(pictures.count)"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

}
