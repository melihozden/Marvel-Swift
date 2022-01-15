//
//  CharacterDetailVC.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 14.01.2022.
//

import UIKit
import SDWebImage

class CharacterDetailVC: UIViewController {
    
    var reuseIdentifier = "ComicCell" // Cell identifier
    lazy var comicVC = UIStoryboard(name: "ComicView", bundle: nil).instantiateViewController(withIdentifier: "ComicVC")
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageContentView: UIView!
    var selectedCharacter : CharacterViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.backgroundColor = .smokeBlack
        view.backgroundColor = .smokeBlack
      
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupUI()
        
    }
    
    func setupUI(){
        
        imageView.sd_setImage(with: URL(string: selectedCharacter!.characterImage), placeholderImage: UIImage(named: "cherries.png"), options: .continueInBackground, completed: nil)
        imageView.layer.cornerRadius = 10
        imageContentView.layer.cornerRadius = 10
        // Shadowing
        imageContentView.layer.shadowColor = UIColor.black.cgColor
        imageContentView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        imageContentView.layer.shadowRadius = 10.0
        imageContentView.layer.shadowOpacity = 0.2
        imageView.contentMode = .scaleToFill
        
        titleLabel.text = selectedCharacter?.characterName
        descriptionLabel.text = selectedCharacter?.characterDesc
    
        collectionView.backgroundColor = .smokeBlack
    }
    
    override func viewWillLayoutSubviews() {
        descriptionLabel.sizeToFit()
    }
    
}

extension CharacterDetailVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let comicViewController = ComicVC()
        
        if #available(iOS 15.0, *) {
            if let sheet = comicVC.sheetPresentationController{
                sheet.detents = [
                    .medium()
                ]
                
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 24
                self.present(comicVC, animated: true, completion: nil)
            }
        } else {
            // Fallback on earlier versions
        }
        
        print(indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ComicCell
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.layer.cornerRadius = 32
        cell.imageView.layer.borderColor = UIColor.white.cgColor
        cell.imageView.layer.borderWidth = 2
        
        
        
        return cell
    }
    
}
