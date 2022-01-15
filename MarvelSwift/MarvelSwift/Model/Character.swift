//
//  Character.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 13.01.2022.
//

import Foundation

struct Character : Codable {
    
    let id : Int?
    let name : String?
    let description : String?
    let thumbnail : ThumbnailModel?
    
    let comics : Comic?
}
