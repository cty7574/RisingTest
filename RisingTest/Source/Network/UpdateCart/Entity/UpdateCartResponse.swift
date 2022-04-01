//
//  UpdateCartResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

struct UpdateCartResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: UpdateCartResult
}

struct UpdateCartResult: Decodable{
    var basket_id: Int
    var item_id: Int
}
