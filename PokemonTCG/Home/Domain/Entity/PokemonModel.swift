//
//  PokemonModel.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import Foundation

struct ListPokemon {
    let id, name: String
    let image: String?
}

struct PageModel {
    let page, pageSize, count, totalCount: Int
}

struct PokemonData {
    let pokemons: [ListPokemon]
    let page: PageModel
}
