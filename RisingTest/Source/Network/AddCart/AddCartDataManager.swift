//
//  AddCartDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

import Alamofire

class AddCartDataManager{
    public func postAddCart(_ items: [AddCartList], delegate: AddCartViewController){
        let headers : HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        let params = ["item_list": items]
        
        AF.request("https://prod.sosocamp.shop/baskets",
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: headers)
            .validate()
            .responseDecodable(of: AddCartResponse.self) {
                response in
                
                switch response.result{
                case .success(let response):
                    if response.isSuccess{
                        delegate.didSuccessAddCart(response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                    print(items)
                }
            
            }
    }
}
