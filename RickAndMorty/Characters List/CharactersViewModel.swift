//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//

import Combine
import Foundation

protocol CharactersViewModelType {
    @MainActor
    func getCharactersNextPage()
    var characters: AnyPublisher<[RickAndMortyCharacter], ServiceErrors> { get }
}

final class CharactersViewModel: CharactersViewModelType {
    
    private let coordinator: AppCoordinatorType
    private let repository: CharactersRepositoryType
    private var charactersList: [RickAndMortyCharacter] = []
    private var currentPage: Int = 0
    private var _characters = PassthroughSubject<[RickAndMortyCharacter], ServiceErrors>()
    var characters: AnyPublisher<[RickAndMortyCharacter], ServiceErrors> {
        _characters
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    init(coordinator: AppCoordinatorType, repository: CharactersRepositoryType) {
        self.coordinator = coordinator
        self.repository = repository
    }

    public func getCharactersNextPage() {
        Task {
            do {
                let characters = try await repository.fetchCharacters(page: currentPage)
                charactersList.append(contentsOf: characters.results)
                _characters.send(charactersList)
            } catch {
                guard let error = error as? ServiceErrors else { return }
                _characters.send(completion: .failure(error))
            }
        }
    }
}
