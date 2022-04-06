//
//  GetWishRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import Alamofire

class GetWishRequest{
    func getWishList(delegate: WishListViewController){
        let url = "https://prod.sosocamp.shop/watchlists"
        let headers: HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .responseDecodable(of: GetWishResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    delegate.didSuccessGetWishLists(response.result)
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    delegate.failedToRequest()
                }
            }
    }
}
