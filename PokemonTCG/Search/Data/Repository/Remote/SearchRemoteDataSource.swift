//
//  SearchRemoteDataSource.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 08/08/23.
//

import RxSwift

class SearchRemoteDataSource {
    
    func getSearchResult(page: Int, query: String) -> Observable<PokemonDAO> {
        let alamofire: RxAlamofireHelper<PokemonDAO> = RxAlamofireHelper()
        return alamofire.request(url: "https://api.pokemontcg.io/v2/cards?pageSize=8&page=\(page)&q=\(query)")
    }
}
