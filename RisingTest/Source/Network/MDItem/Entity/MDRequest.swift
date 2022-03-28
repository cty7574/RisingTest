//
//  MDRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit
import Alamofire

class MDRequest {
    
    func getMDData() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let url = "https://dev.sosocamp.shop/recommend-items/\(1)?createDate=\(formatter.string(from: Date()))"
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .responseDecodable(of: MDResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> MD Items Response \(response) ")
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                }
            }
    }
}
