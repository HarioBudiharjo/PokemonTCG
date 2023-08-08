//
//  RxAlamofireHelper.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import Alamofire
import RxSwift

class RxAlamofireHelper<T: Codable> {
    
    func request(url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil) -> Observable<T> {
        return Observable.create { observer in
            let request = AF.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
