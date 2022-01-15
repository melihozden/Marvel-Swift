//
//  ThumbnailModel.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 14.01.2022.
//

import Foundation

struct ThumbnailModel : Codable {
    let path : String?
    let extensionType : String?
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case extensionType = "extension"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        extensionType = try values.decodeIfPresent(String.self, forKey: .extensionType)
    }
}
