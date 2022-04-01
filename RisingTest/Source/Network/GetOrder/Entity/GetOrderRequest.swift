//
//  GetOrderRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

import Alamofire

class GetOrderRequest{
    func getOrderData(delegate: GetOrderViewController){
        let url = "https://prod.sosocamp.shop/order-lists"
        let headers: HTTPHeaders = ["x-access-token": ViewController.jwt!]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .responseDecodable(of: GetOrderResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    delegate.didSuccessGetOrderData(response.result)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    
                }
            }
    }
}
