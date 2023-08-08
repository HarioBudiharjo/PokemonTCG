//
//  HomeRemoteDataSource.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import RxSwift

class HomeRemoteDataSource {
    
    func getListHome(page: Int) -> Observable<PokemonDAO> {
        let alamofire: RxAlamofireHelper<PokemonDAO> = RxAlamofireHelper()
        return alamofire.request(url: "https://api.pokemontcg.io/v2/cards?pageSize=8&page=\(page)")
    }
}
