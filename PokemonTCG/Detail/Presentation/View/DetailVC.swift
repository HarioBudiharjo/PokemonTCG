//
//  DetailVC.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import UIKit
import RxSwift
import Kingfisher

class DetailVC: UIViewController {

    var data: ListPokemon?
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var abillitiesLabel: UILabel!

    let viewModel = DetailViewModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getDetail(id: self.data?.id ?? "")
        self.setupObserver()
    }
    
    func setupObserver() {
        self.viewModel.detailPokemon.compactMap { $0 }.subscribe { pokemonData in
            self.nameLabel.text = pokemonData.name
            self.attackLabel.text = pokemonData.attack
            self.abillitiesLabel.text = pokemonData.abilities
            let url = URL(string: pokemonData.image)
            self.pokemonImage.kf.setImage(with: url)
        }.disposed(by: disposeBag)
    }
    
}
