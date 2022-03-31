//
//  GetCartRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import Alamofire

class GetCartRequest {
    func getCartData(delegate: CartViewController){
        let url = "https://dev.sosocamp.shop/baskets"
        let headers: HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .responseDecodable(of: GetCartResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> Get Cart Items Response \(response) ")
                    delegate.didSuccessGetCart(response.result)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    
                }
            }
    }
}
