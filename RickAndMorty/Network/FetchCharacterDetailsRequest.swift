//
//  FetchCharactersRequest.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//


final class FetchCharacterDetailsRequest: RequestType {
    
    typealias Response = RickAndMortyCharacter
    
    lazy var url: String = "https://rickandmortyapi.com/api/character"
    
    var method: RequestMethod = .get
    
    let id: Int
    
    lazy var parameters: [String: String] = {
        ["id": "\(id)"]
    }()
    
    init(id: Int) {
        self.id = id
    }
}
