//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 13/01/2025.
//

import UIKit
import Kingfisher
import Cartography

final class CharacterTableViewCell: UITableViewCell {
    
    static let ID: String = "CharacterTableViewCellID"
    
    private let nameLabel = UILabel()
    private let speciesLabel = UILabel()
    private let image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(name: String, species: String, image: String) {
        nameLabel.text = name
        speciesLabel.text = species
        self.image.kf.setImage(with: URL(string: image))
    }
    
    private func setupUI() {
        speciesLabel.font = .systemFont(ofSize: 20)
        let parentStackView = UIStackView()
        parentStackView.axis = .horizontal
        parentStackView.spacing = 8
        constrain(image) { image in
            image.width == 50
            image.height == 50
        }
        parentStackView.addArrangedSubview(image)
        let nameAndSpeciesStackView = UIStackView()
        nameAndSpeciesStackView.axis = .vertical
        nameAndSpeciesStackView.spacing = 4
        nameAndSpeciesStackView.addArrangedSubview(nameLabel)
        nameAndSpeciesStackView.addArrangedSubview(speciesLabel)
        parentStackView.addArrangedSubview(nameAndSpeciesStackView)
        self.addSubview(parentStackView)
        constrain(self,  parentStackView) { view, parentStackView in
            parentStackView.leading == view.leading
            parentStackView.trailing == view.trailing
            parentStackView.top == view.top
            parentStackView.bottom == view.bottom
        }
    }
}
