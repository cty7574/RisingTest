//
//  AddReviewDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import Alamofire

class AddReviewDataManager{
    func postAddReview(_ parameters: AddReviewRequest, delegate: AddReviewViewController){
        let url = "https://prod.sosocamp.shop/reviews"
        let headers: HTTPHeaders = ["x-access-token": ViewController.jwt!]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: headers)
            .validate()
            .responseDecodable(of: AddReviewResponse.self) {
                response in
                
                switch response.result{
                case .success(let response):
                    if response.isSuccess{
                        delegate.didSuccessAddReview()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                }
            
            }
    }
}
