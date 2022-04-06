//
//  AddReviewRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

struct AddReviewRequest: Encodable{
    var item_id: Int
    var title: String
    var content: String
}
