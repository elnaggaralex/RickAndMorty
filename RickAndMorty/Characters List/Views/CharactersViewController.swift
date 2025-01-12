//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 10/01/2025.
//

import UIKit
import Cartography
import Combine

class CharactersViewController: UIViewController {

    private let viewModel: CharactersViewModelType
    private var characters: [RickAndMortyCharacter] = []
    private let charactersTableView = UITableView()
    private var cancellables = Set<AnyCancellable>()
    init(viewModel: CharactersViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTableView()
        subscribeToCharacters()
    }
    
    private func subscribeToCharacters() {
        viewModel.getCharactersNextPage()
        viewModel.characters
            .sink { completion in
                switch completion {
                case .failure(let error):
                    // Handle error
                    print(error.localizedDescription)
                case .finished:
                    // do nothing for now
                    break
                }
            } receiveValue: {[weak self] characters in
                self?.characters = characters
                self?.charactersTableView.reloadData()
            }
            .store(in: &cancellables)
    }
    private func setupTableView() {
        charactersTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.ID)
        view.addSubview(charactersTableView)
        
        constrain(view, charactersTableView) { view, charactersTableView in
            charactersTableView.leading == view.leadingMargin
            charactersTableView.trailing == view.trailingMargin
            charactersTableView.bottom == view.bottomMargin - 16
            charactersTableView.top == view.topMargin + 16
        }
        
        charactersTableView.dataSource = self
    }
}

extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.ID) as? CharacterTableViewCell
        else {
            fatalError("Cell type is not correct")
        }
        let character = characters[indexPath.row]
        cell.setData(name: character.name, species: character.species, image: character.image)
        return cell
    }
}

