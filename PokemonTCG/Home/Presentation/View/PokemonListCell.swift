//
//  PokemonListCell.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 06/08/23.
//

import UIKit
import Kingfisher

class PokemonListCell: UITableViewCell {
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setView(data: ListPokemon) {
        let url = URL(string: data.image ?? "")
        self.cardImage.kf.setImage(with: url)
        self.nameLabel.text = data.name
    }
}
