//
//  DetailRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit
import Alamofire

class DetailRequest {
    
    func getDetailData(_ postID: Int) {
        
        let url = "https://prod.sosocamp.shop/items?postID=\(postID)"
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .responseDecodable(of: DetailResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> Sale Items Response \(response) ")
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    
                }
            }
    }
    
}
