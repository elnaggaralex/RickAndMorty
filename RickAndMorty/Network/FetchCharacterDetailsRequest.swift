//
//  FetchCharactersRequest.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//


final class FetchCharacterDetailsRequest: RequestType {
    
    typealias Response = RickAndMortyCharacter
    
    lazy var url: String = "https://rickandmortyapi.com/api/character/\(id)"
    
    var method: RequestMethod = .get
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
}
