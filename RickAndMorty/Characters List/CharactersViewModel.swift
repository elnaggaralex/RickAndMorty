//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//

import Combine

protocol CharactersViewModelType {
    @MainActor
    func getCharactersNextPage()
}

final class CharactersViewModel: CharactersViewModelType {
    
    private let coordinator: AppCoordinatorType
    private let repository: CharactersRepositoryType
    private var characters: [RickAndMortyCharacter] = []
    private var currentPage: Int = 0
    
//    var charactersSubject: AnyPublisher<[RickAndMortyCharacter]> {
//
//    }
    init(coordinator: AppCoordinatorType, repository: CharactersRepositoryType) {
        self.coordinator = coordinator
        self.repository = repository
    }

    public func getCharactersNextPage() {
        Task {
            do {
                let characters = try await repository.fetchCharacters(page: currentPage)
            } catch {
                print(error)
            }
        }
    }
}
