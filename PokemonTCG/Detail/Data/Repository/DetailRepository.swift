//
//  DetailRepository.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 08/08/23.
//

import RxSwift

class DetailRepository {
    
    let remote = DetailRemoteDataSource()
    
    func getDetail(id: String) -> Observable<PokemonDetailDAO> {
        return remote.getDetail(id: id)
    }
}
