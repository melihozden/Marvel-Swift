//
//  ServiceHandler.swift
//  MarvelSwift
//
//  Created by Melih Ozden - HB on 13.01.2022.
//

import Foundation
import Alamofire

class ServiceHandler{
    
    let marvelApi = MarvelApi()
    
    func getCharacters(completion: @escaping ([Character]?) -> ()){
        
        guard let url = URL(string: "\(marvelApi.baseUrl)/v1/public/characters?&ts=\(marvelApi.timeStamp)&apikey=\(marvelApi.apiKey)&hash=\(marvelApi.hashKey)") else { return}
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            
            do{
                if(response.result.isSuccess){
                    let result = try JSONDecoder().decode(ResponseModel.self, from: response.data!)
                    
                    completion(result.data?.results)
                }
                }catch{
                    print(response.error ?? "Error")
                }
        }
    }
    
    func getComicsById(_ id:Int, completion: @escaping ([CharacterComic]?) -> ()){
        guard let url = URL(string: "\(marvelApi.baseUrl)/v1/public/characters/\(id)/comics?&ts=\(marvelApi.timeStamp)&apikey=\(marvelApi.apiKey)&hash=\(marvelApi.hashKey)") else { return}
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            
            do{
                if(response.result.isSuccess){
                    let result = try JSONDecoder().decode(ComicResponseModel.self, from: response.data!)
                    
                    completion(result.data?.results)
                }
                }catch{
                    print(response.error ?? "Error")
                }
        }
    }
    
}
