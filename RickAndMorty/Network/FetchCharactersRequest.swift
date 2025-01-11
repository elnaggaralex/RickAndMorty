//
//  FetchCharactersRequest.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//


final class FetchCharactersRequest: RequestType {
    
    typealias Response = CharactersData
    
    lazy var url: String = "https://rickandmortyapi.com/api/character/\(page)"
    
    var method: RequestMethod = .get
    
    let page: Int
    
    init(page: Int) {
        self.page = page
    }
}
