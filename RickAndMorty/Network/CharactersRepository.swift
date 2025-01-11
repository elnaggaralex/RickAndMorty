//
//  CharactersRepository.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//


protocol CharactersRepositoryType {
    /// Get Rick and Morty list of characters
    /// - Parameter page: the next page of the characters
    /// - Returns: Characters data which include info about the list of the characters and list of the characters
    func fetchCharacters(page: Int) async throws -> CharactersData
    
    /// Get character details like name, gender, ...
    /// - Parameter id: id of the character
    /// - Returns: Character details object
    func fetchCharacterDetails(id: Int) async throws -> RickAndMortyCharacter
}

final class CharactersRepository: CharactersRepositoryType {
    
    let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    func fetchCharacters(page: Int) async throws -> CharactersData {
        let request = FetchCharactersRequest(page: page)
        return try await networkService.request(request: request)
    }
    
    func fetchCharacterDetails(id: Int) async throws -> RickAndMortyCharacter {
        let request = FetchCharacterDetailsRequest(id: id)
        return try await networkService.request(request: request)
    }
}
