//
//  GetReviewRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

import Alamofire

class GetReviewRequest{
    func getReviewData(_ parameters: Int, delegate: ReviewViewController){
        let url = "https://dev.sosocamp.shop/reviews?postId=\(parameters)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .responseDecodable(of: GetReviewResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> Get Review Items Response \(response) ")
                    delegate.didSuccessGetReviews(response.result)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    
                }
            }
    }
}
