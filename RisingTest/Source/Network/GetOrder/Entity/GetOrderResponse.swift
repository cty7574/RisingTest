//
//  GetOrderResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//


struct GetOrderResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [GetOrderResult]
}

struct GetOrderResult: Decodable{
    var vendor: String
    var image: String
    var item_name: String
    var title: String
    var item_price: Int
    var quantity: Int
    var group: Int
    var pay: String
    var order_date: String
    var address: String
    var status: String
}
