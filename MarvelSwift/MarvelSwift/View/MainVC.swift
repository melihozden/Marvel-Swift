//
//  ViewController.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 11.01.2022.
//

import UIKit
import SDWebImage

class MainVC: UIViewController {

    var reuseIdentifier = "Cell" // Cell identifier
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var characterListViewModel : CharacterListViewModel!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavBar()
        
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
      
        getCharacters()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.backgroundColor = .smokeBlack;
    }
    
    // MARK: - Utilities
    func setupUI(){
        view.backgroundColor = .smokeBlack;
    }
    
    func setupNavBar(){
        UINavigationBar.appearance().isTranslucent = true
        
        self.navigationItem.title = ""
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        imageView.contentMode = .scaleAspectFit

            let image = UIImage(named: "MarvelLogo")
            imageView.layer.cornerRadius = 5.0
            imageView.image = image

            navigationItem.titleView = imageView
        
    }
    // MARK: - Service
    func getCharacters(){
        
        ServiceHandler().getCharacters{ characters in
            
            if let characters = characters {
                self.characterListViewModel = CharacterListViewModel(characterList: characters)
               
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }
            
        }
        
    }
    
}

extension MainVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characterListViewModel?.numberOfCharacters() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let characterDetailVC = storyboard.instantiateViewController(withIdentifier: "characterDetailVC") as! CharacterDetailVC

        let selectedCharacter = self.characterListViewModel?.characterAtIndex(indexPath.row)
        
        characterDetailVC.selectedCharacter = selectedCharacter
        self.navigationController?.pushViewController(characterDetailVC, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CharacterCell
        let character = self.characterListViewModel?.characterList[indexPath.row]
        let imageString = (character?.thumbnail?.path)!+"."+(character?.thumbnail?.extensionType)!
        
        cell.characterImageView.sd_setImage(with: URL(string: imageString), placeholderImage: UIImage(named: "cherries.png"), options: .continueInBackground, completed: nil)
        cell.characterImageView.contentMode = .scaleToFill
        cell.characterTitleLabel.text = character?.name
        
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
}
