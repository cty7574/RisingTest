//
//  AddOrderDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

import Alamofire

class AddOrderDataManager{
    func postAddOrderData(_ parameters: AddOrderRequest, delegate: AddOrderViewController){
        let url = "https://prod.sosocamp.shop/order-lists"
        let headers: HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: headers)
            .validate()
            .responseDecodable(of: AddOrderResponse.self) {
                response in
                
                switch response.result{
                case .success(let response):
                    if response.isSuccess{
                        delegate.didSuccessAddOrder()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    
                }
            
            }
    }
}
