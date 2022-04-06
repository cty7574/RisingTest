//
//  FixReviewResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

struct FixReviewResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [FixReviewResult]
}

struct FixReviewResult: Decodable{
    var review_id: Int
}
