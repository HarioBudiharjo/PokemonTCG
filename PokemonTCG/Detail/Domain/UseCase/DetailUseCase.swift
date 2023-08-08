//
//  DetailUseCase.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 08/08/23.
//

import RxSwift

class DetailUseCase {
    
    let repository = DetailRepository()
    
    func getDetail(id: String) -> Observable<PokemonDetail?> {
        return repository.getDetail(id: id).map { pokemonDetailDao in
            return pokemonDetailDao.mapToDetail()
        }
    }
}


