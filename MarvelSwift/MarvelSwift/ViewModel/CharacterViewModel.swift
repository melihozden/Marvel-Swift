//
//  CharacterViewModel.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 13.01.2022.
//

import Foundation

struct CharacterListViewModel{
    
    let characterList : [Character]
    
    func numberOfCharacters() -> Int{
        return self.characterList.count
    }
    
    func characterAtIndex(_ index: Int) -> CharacterViewModel{
        let character = self.characterList[index]
        return CharacterViewModel(character)
    }
}

struct CharacterViewModel{
    
    let character : Character
    
    init(_ character:Character) {
        self.character = character
    }
    
    var characterName : String{
        return self.character.characterName
    }
    
    var characterDesc : String{
        return self.character.characterDesc
    }
    
    var characterImage : String{
        return self.character.characterImage
    }
    
    var characterComics : [Comic]{
        return self.character.characterComics
    }
    
}
