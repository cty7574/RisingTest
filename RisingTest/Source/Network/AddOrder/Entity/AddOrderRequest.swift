//
//  AddOrderRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

struct AddOrderRequest: Encodable{
    var orderList: [Int]
    var pay: String
}
