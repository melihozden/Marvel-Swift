//
//  Response.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 13.01.2022.
//

import Foundation

struct ResponseModel : Codable{
    let code : Int?
    let status : String?
    let copyright : String?
    let attributionText : String?
    let attributionHTML : String?
    let etag : String?
    let data : Response?
}

struct Response: Codable {
    let offset: Int?
    let limit : Int?
    let count : Int?
    let total : Int?
    let results : [Character]?
}

struct ComicResponseModel : Codable{
    let code : Int?
    let status : String?
    let copyright : String?
    let attributionText : String?
    let attributionHTML : String?
    let etag : String?
    let data : ComicResponse?
}

struct ComicResponse : Codable{
    let offset: Int?
    let limit : Int?
    let count : Int?
    let total : Int?
    let results : [CharacterComic]?
}
