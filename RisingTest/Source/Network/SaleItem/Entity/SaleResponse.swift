//
//  SaleResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

struct SaleResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: SaleResult
}

struct SaleResult: Decodable{
    var post_id: Int
    var image: String
    var vendor: String
    var title: String
    var intro: String
    var off: Int
}
