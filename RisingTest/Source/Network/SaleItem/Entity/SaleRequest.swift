//
//  SaleRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit
import Alamofire

class SaleRequest {
    
    func getSaleData(delegate: RecommendViewController) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let url = "https://dev.sosocamp.shop/deal-items?createDate=\(formatter.string(from: Date()))"
        //let url = "https://dev.sosocamp.shop/deal-items?createDate=2022-03-29"
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .responseDecodable(of: SaleResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> Sale Items Response \(response) ")
                    delegate.didSuccessGetSaleItems(response)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    
                }
            }
    }
    
}
