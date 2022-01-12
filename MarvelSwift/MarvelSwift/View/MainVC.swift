//
//  ViewController.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 11.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var reuseIdentifier = "Cell" // Cell identifier
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.collectionView.frame.size.width    // for iPhone 13 it's 414
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        design.minimumLineSpacing = 5
        design.minimumInteritemSpacing = 5
        
        let cellWidth = (width-40) / 2
        
        design.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.5)
        
        collectionView!.collectionViewLayout = design
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        UINavigationBar.appearance().tintColor = UIColor.white
        self.navigationItem.title = "Marvel"
        view.backgroundColor = .smokeBlack;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.backgroundColor = .smokeBlack;
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CharacterCell
        
        cell.characterImageView.image = UIImage(named: "cherries")
        cell.characterTitleLabel.text = "Deneme";
        
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
}

