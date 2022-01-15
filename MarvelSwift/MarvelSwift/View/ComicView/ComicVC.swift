//
//  ComicVC.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 15.01.2022.
//

import UIKit

class ComicVC: UIViewController {

    
    @IBOutlet weak var comicImageView: UIImageView!
    @IBOutlet weak var comicTitleLabel: UILabel!
    @IBOutlet weak var comicDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .smokeBlack
        
    }
}
