//
//  CharacterViewModel.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 13.01.2022.
//

import Foundation

struct CharacterListViewModel{
    let characterList : [Character]
}

struct CharacterViewModel{
    
    let character : Character
    
    init(_ character:Character) {
        self.character = character
    }
    
    var characterName : String{
        return self.character.name ?? ""
    }
    
    var characterDesc : String{
        if(self.character.description == ""){
            return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequatum."
        }
        return self.character.description ?? ""
    }
    
    var characterImage : String{
        return (character.thumbnail?.path)!+"."+(character.thumbnail?.extensionType)!
    }
    
    var characterComics : Comic?{
        return self.character.comics ?? nil
    }
}

extension CharacterListViewModel {
    
    func numberOfCharacters() -> Int{
        return self.characterList.count
    }
    
    func characterAtIndex(_ index: Int) -> CharacterViewModel{
        let character = self.characterList[index]
        return CharacterViewModel(character)
    }
}
