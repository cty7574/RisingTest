//
//  DetailResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

struct DetailResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [DetailResult]
}

struct DetailResult: Decodable{
    var name: String
    var price: Int
    var gift_enable: Bool
    var image: String
}
