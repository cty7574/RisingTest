//
//  GetReviewResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

struct GetReviewResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [GetReviewResult]
}

struct GetReviewResult: Decodable{
    var review_id: Int
    var title: String
    var name: String
    var content: String
    var createDate: String
}
