//
//  AddCartResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

struct AddCartResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: AddCartResult
}

struct AddCartResult: Decodable{
    var basket_id: [Int]
}
