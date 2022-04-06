//
//  AddReviewResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

struct AddReviewResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: AddReviewResult
}

struct AddReviewResult: Decodable{
    var review_id: Int
}
