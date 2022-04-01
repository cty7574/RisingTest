//
//  UpdateCartManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

import Alamofire

class UpdateCartManager{
    func patchUpdateCartData(_ parameters: UpdateCartRequest,_ itemId: Int, delegate: CartViewController){
        let url = "https://prod.sosocamp.shop/baskets/\(itemId)"
        let headers: HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        
        AF.request(url,
                   method: .patch,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: headers)
            .validate()
            .responseDecodable(of: UpdateCartResponse.self) {
                response in
                
                switch response.result{
                case .success(let response):
                    if response.isSuccess{
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            
            }
    }
}
