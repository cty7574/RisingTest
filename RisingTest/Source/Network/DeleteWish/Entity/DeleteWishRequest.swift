//
//  DeleteWishRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import Alamofire

class DeleteWishRequest{
    func deleteWishList(_ item_id: Int, delegate: WishListViewController){
        let url = "https://prod.sosocamp.shop/watchlists/\(item_id)"
        let headers: HTTPHeaders = ["x-access-token": ViewController.jwt!]
        
        AF.request(url,
                   method: .delete,
                   parameters: nil,
                   headers: headers)
            .responseDecodable(of: DeleteWishResponse.self){ response in
                switch response.result {
                    
                case .success(let response):
                    if response.isSuccess {
                        delegate.didSuccessDeleteWishLists()
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                }
            }
    }
}
