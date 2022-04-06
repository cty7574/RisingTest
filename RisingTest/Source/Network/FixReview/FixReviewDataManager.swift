//
//  FixReviewDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import Alamofire

class FixReviewDataManager{
    func patchFixReviewData(_ parameters: FixReviewRequest,_ reviewId: Int, delegate: FixReviewViewController){
        let url = "https://prod.sosocamp.shop/reviews/\(reviewId)"
        let headers: HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        
        AF.request(url,
                   method: .patch,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: headers)
            .validate()
            .responseDecodable(of: FixReviewResponse.self) {
                response in
                
                switch response.result{
                case .success(let response):
                    if response.isSuccess{
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                }
            
            }
    }
}
