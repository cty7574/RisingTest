//
//  AddOrderResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

struct AddOrderResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
}


