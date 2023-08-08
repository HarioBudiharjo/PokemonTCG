//
//  SearchUseCase.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 08/08/23.
//

import RxSwift

class SearchUseCase {
    
    let repository = SearchRepository()
    
    func getListHome(page: Int, search: String, option: Int) -> Observable<PokemonData?> {
        let query = setQuery(search: search, option: option)
        return repository.getSearchResult(page: page, query: query).map { pokemonDao in
            let page = pokemonDao.mapToPage()
            let listPokemon = pokemonDao.mapToListPokemon()
            let pokemonData = PokemonData(pokemons: listPokemon, page: page)
            return pokemonData
        }
    }
    
    private func setQuery(search: String, option: Int) -> String {
        switch option {
        case 1:
            return "types:\(search)"
        case 2:
            return "evolvesFrom:\(search)"
        default:
            return "name:\(search)"
        }
    }
}
