//
//  Character.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 13.01.2022.
//

import Foundation

struct Character : Codable {
    
    let characterName : String
    let characterDesc : String
    let characterImage : String
    
    var characterComics : [Comic] = []
}
