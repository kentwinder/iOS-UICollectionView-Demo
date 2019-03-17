//
//  AnimalsViewController.swift
//  CollectionView-Demo
//
//  Created by Kent Winder on 03/17/2019.
//  Copyright © 2019 Kent Winder. All rights reserved.
//

import UIKit

class AnimalsViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var size: CGSize!
    var itemsPerRow: CGFloat = 3
    var selectedAnimal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UI_USER_INTERFACE_IDIOM() == .pad){
            itemsPerRow = 6
        }
        size = CGSize(width: view.frame.width / itemsPerRow, height: view.frame.width / itemsPerRow)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 33
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "AnimalCollectionViewCell", for: indexPath) as! AnimalCollectionViewCell
        cell.imageView.image = UIImage(named: "animal\(indexPath.row + 1)")
        return cell
    }
}

extension AnimalsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedAnimal = "animal\(indexPath.row + 1)"
        performSegue(withIdentifier: "AnimalsToAnimal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AnimalsToAnimal" {
            let animalViewController = segue.destination as! AnimalViewController
            animalViewController.imageName = selectedAnimal
        }
    }
}

