//
//  DetailViewModel.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import RxSwift
import RxRelay

class DetailViewModel {
    let useCase = DetailUseCase()
    
    var detailPokemon: BehaviorRelay<PokemonDetail?> = BehaviorRelay(value: nil)
    let disposeBag = DisposeBag()
    
    func getDetail(id: String) {
        self.useCase.getDetail(id: id).subscribe { pokemonDetail in
            self.detailPokemon.accept(pokemonDetail)
        }.disposed(by: disposeBag)
    }
}
