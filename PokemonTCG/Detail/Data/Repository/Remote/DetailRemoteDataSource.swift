//
//  DetailRemoteDataSource.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 08/08/23.
//

import RxSwift

class DetailRemoteDataSource {
    
    func getDetail(id: String) -> Observable<PokemonDetailDAO> {
        let alamofire: RxAlamofireHelper<PokemonDetailDAO> = RxAlamofireHelper()
        return alamofire.request(url: "https://api.pokemontcg.io/v2/cards/\(id)")
    }
}
