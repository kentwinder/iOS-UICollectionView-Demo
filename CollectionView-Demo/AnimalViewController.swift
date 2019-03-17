//
//  AnimalViewController.swift
//  CollectionView-Demo
//
//  Created by Kent Winder on 03/17/2019.
//  Copyright © 2019 Kent Winder. All rights reserved.
//

import UIKit

class AnimalViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imageName)
    }
}
