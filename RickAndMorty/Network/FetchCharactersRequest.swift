//
//  FetchCharactersRequest.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//


final class FetchCharactersRequest: RequestType {
    
    typealias Response = CharactersData
    
    lazy var url: String = "https://rickandmortyapi.com/api/character"
    
    var method: RequestMethod = .get
    
    let page: Int
    
    lazy var parameters: [String: String] = {
        ["page": "\(page)"]
    }()

    init(page: Int) {
        self.page = page
    }
}
