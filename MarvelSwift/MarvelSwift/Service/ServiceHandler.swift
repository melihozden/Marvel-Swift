//
//  ServiceHandler.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 13.01.2022.
//

import Foundation

class ServiceHandler{
    
    func getCharacters(url: URL, completion: @escaping([Character]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
            
                let characterList = try? JSONDecoder().decode([Character].self,from: data)
                print(characterList ?? "")
                
                if let characterList = characterList{
                    completion(characterList)
                }
            }
        }
    }
    
}
