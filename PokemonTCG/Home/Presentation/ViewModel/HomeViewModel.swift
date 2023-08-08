//
//  HomeViewModel.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import RxSwift
import RxRelay

class HomeViewModel {
    let useCase = HomeUseCase()
    
    var listPokemon: BehaviorRelay<PokemonData?> = BehaviorRelay(value: nil)
    let disposeBag = DisposeBag()
    
    func getListPokemon(page: Int) {
        self.useCase.getListHome(page: page).subscribe { pokemonData in
            self.listPokemon.accept(pokemonData)
        }.disposed(by: disposeBag)
    }
}
