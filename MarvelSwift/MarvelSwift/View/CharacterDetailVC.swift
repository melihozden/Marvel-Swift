//
//  CharacterDetailVC.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 14.01.2022.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class CharacterDetailVC: UIViewController {
    
    private var comicListViewModel : ComicListViewModel!
    var reuseIdentifier = "ComicCell" // Cell identifier
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageContentView: UIView!
    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    
    var selectedCharacter : CharacterViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.backgroundColor = .smokeBlack
        view.backgroundColor = .smokeBlack
      
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupUI()
        getComics()
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
    
    // MARK: - Service
    func getComics(){
        
        indicatorView.type = .ballRotateChase
        indicatorView.color = .smokeWhite
       
        indicatorView.startAnimating()
        ServiceHandler().getComicsById(selectedCharacter?.character.id ?? 0) { comics in
            
            if let comics = comics {
                self.comicListViewModel = ComicListViewModel(comicList: comics)
               
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.indicatorView.stopAnimating()
            }
        }
    }
}

extension CharacterDetailVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.comicListViewModel?.numberOfComics() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "ComicView", bundle: nil)
        let comicVC = storyboard.instantiateViewController(withIdentifier: "comicVC") as! ComicVC
        
        let selectedComic = self.comicListViewModel?.comicAtIndex(indexPath.row)
        comicVC.selectedComic = selectedComic
        
        if #available(iOS 15.0, *) {
            if let sheet = comicVC.sheetPresentationController{
                sheet.detents = [
                    .medium(),
                    .large()
                ]
                
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 24
                self.present(comicVC, animated: true, completion: nil)
            }
        } else {
            // Earlier versions
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ComicCell
        let comic = self.comicListViewModel?.comicList[indexPath.row]
        let imageString = (comic?.thumbnail?.path)!+"."+(comic?.thumbnail?.extensionType)!
        
        cell.imageView.sd_setImage(with: URL(string: imageString), placeholderImage: UIImage(named: ""), options: .continueInBackground, completed: nil)
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.layer.cornerRadius = 32
        cell.imageView.layer.borderColor = UIColor.white.cgColor
        cell.imageView.layer.borderWidth = 2
        
        return cell
    }
    
}
