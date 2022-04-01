//
//  DeleteCartRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

import Alamofire

class DeleteCartRequest{
    func deleteCartData(_ itemId: Int, delegate: CartViewController){
        let url = "https://prod.sosocamp.shop/baskets/\(itemId)"
        let headers: HTTPHeaders = ["x-access-token" : ViewController.jwt!]

        
        AF.request(url,
                   method: .delete,
                   parameters: nil,
                   headers: headers)
            .responseDecodable(of: DeleteCartResponse.self){ response in
                switch response.result {
                    
                case .success(let response):
                    if response.isSuccess {
                        delegate.didSuccessDeleteCart()
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    print("url: ",url)
                    print("id: ",itemId)
                    delegate.failedToRequest(message: "장바구니 삭제 실패!")
                }
            }
    }
}
