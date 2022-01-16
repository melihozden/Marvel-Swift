//
//  ComicVC.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 15.01.2022.
//

import UIKit
import SDWebImage

class ComicVC: UIViewController {

    var selectedComic : ComicViewModel?
    
    @IBOutlet weak var comicImageView: UIImageView!
    @IBOutlet weak var comicTitleLabel: UILabel!
    @IBOutlet weak var comicDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .smokeWhite
        
        comicImageView.layer.cornerRadius = 10.0
        comicImageView.layer.borderWidth = 1.0
        comicImageView.layer.borderColor = UIColor.smokeBlack.cgColor
        comicImageView.contentMode = .scaleToFill
        
        comicImageView.sd_setImage(with: URL(string: selectedComic!.comicImage), placeholderImage: UIImage(named: ""), options: .continueInBackground, completed: nil)
        comicTitleLabel.text = selectedComic?.comicTitle
        comicDesc.text = selectedComic?.comicDesc
    }
    
}
