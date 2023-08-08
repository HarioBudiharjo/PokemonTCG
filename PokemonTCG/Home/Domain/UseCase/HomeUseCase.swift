//
//  HomeUseCase.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import RxSwift

class HomeUseCase {
    
    let repository = HomeRepository()
    
    func getListHome(page: Int) -> Observable<PokemonData?> {
        return repository.getListHome(page: page).map { pokemonDao in
            let page = pokemonDao.mapToPage()
            let listPokemon = pokemonDao.mapToListPokemon()
            let pokemonData = PokemonData(pokemons: listPokemon, page: page)
            return pokemonData
        }
    }
}
