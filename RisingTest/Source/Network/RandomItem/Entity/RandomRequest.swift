//
//  RandomRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit
import Alamofire

class RandomRequest {
    
    func getRandomData(delegate: RecommendViewController) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let url = "https://prod.sosocamp.shop/random-items?createDate=2022-04-01"
        //let url = "https://prod.sosocamp.shop/random-items?createDate=\(formatter.string(from: Date()))"
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .responseDecodable(of: RandomResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> Random Items Response \(response) ")
                    delegate.didSuccessGetRandomItems(response)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    
                }
            }
    }
    
}
