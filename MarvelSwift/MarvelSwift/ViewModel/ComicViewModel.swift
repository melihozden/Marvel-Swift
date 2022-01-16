//
//  ComicViewModel.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 16.01.2022.
//

import Foundation

struct ComicListViewModel{
    let comicList : [CharacterComic]
}

struct ComicViewModel {
    
    let comic : CharacterComic
    
    init(_ comic:CharacterComic) {
        self.comic = comic
    }
    
    var comicTitle : String{
        return self.comic.title ?? ""
    }
    
    var comicDesc : String{
        
        if(self.comic.description == "" || self.comic.description == nil){
            return "No Description Avaliable"
        }
        return self.comic.description ?? ""
    }
    
    var comicImage : String{
        return (comic.thumbnail?.path)!+"."+(comic.thumbnail?.extensionType)!
    }
}

extension ComicListViewModel {
    
    func numberOfComics() -> Int{
        return self.comicList.count
    }
    
    func comicAtIndex(_ index: Int) -> ComicViewModel{
        let comic = self.comicList[index]
        return ComicViewModel(comic)
    }
    
}
