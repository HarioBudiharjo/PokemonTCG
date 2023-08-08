//
//  SearchViewModel.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 08/08/23.
//

import RxSwift
import RxRelay

class SearchViewModel {
    let useCase = SearchUseCase()
    
    var listPokemon: BehaviorRelay<PokemonData?> = BehaviorRelay(value: nil)
    let disposeBag = DisposeBag()
    
    func getListPokemon(page: Int, search: String, option: Int) {
        self.useCase.getListHome(page: page, search: search, option: option).subscribe { pokemonData in
            self.listPokemon.accept(pokemonData)
        }.disposed(by: disposeBag)
    }
}
