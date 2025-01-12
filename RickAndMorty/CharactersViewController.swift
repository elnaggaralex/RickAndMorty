//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 10/01/2025.
//

import UIKit

class CharactersViewController: UIViewController {

    let viewModel: CharactersViewModelType
    
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
        viewModel.getCharactersNextPage()
    }
}

