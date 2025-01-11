//
//  FetchCharactersRequest.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//


final class FetchCharactersRequest: RequestType {
    
    typealias Response = CharactersData
    
    var url: String = "https://rickandmortyapi.com/api/"
    
    var method: RequestMethod = .get
}
