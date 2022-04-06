//
//  AddWishDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import Alamofire

class AddWishDataManager{
    func postAddWish(_ parameters: AddWishRequest, delegate: ItemIntroViewController){
        let url = "https://prod.sosocamp.shop/watchlists"
        let headers: HTTPHeaders = ["x-access-token": ViewController.jwt!]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: headers)
            .validate()
            .responseDecodable(of: AddWishResponse.self) {
                response in
                
                switch response.result{
                case .success(let response):
                    if response.isSuccess{
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                }
            
            }
    }
}
