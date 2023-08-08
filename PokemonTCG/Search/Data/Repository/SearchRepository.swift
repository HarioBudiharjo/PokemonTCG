//
//  SearchRepository.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 08/08/23.
//

import RxSwift

class SearchRepository {
    
    let remote = SearchRemoteDataSource()
    
    func getSearchResult(page: Int, query: String) -> Observable<PokemonDAO> {
        return remote.getSearchResult(page: page, query: query)
    }
}
