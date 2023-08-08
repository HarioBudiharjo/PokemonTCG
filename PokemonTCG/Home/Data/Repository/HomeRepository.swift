//
//  HomeRepository.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import RxSwift

class HomeRepository {
    
    let remote = HomeRemoteDataSource()
    
    func getListHome(page: Int) -> Observable<PokemonDAO> {
        return remote.getListHome(page: page)
    }
}
