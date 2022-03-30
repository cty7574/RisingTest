//
//  GetCartResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

struct GetCartResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [GetCartResult]
}

struct GetCartResult: Decodable{
    var basket_id: Int
    var image: String
    var vendor: String
    var title: String
    var off: Int
    var item_id: Int
    var item_name: String
    var item_price: Int
    var quantity: Int
}
