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
    var result: [SaleResult]
}

struct SaleResult: Decodable{
    var post_id: Int
    var image: String
    var vendor: String
    var title: String
    var title_price: Int
    var intro: String
    var off: Int
    var item_list: [sList]
}

struct sList: Decodable{
    var item_id: Int
    var item_name: String
    var item_image: String
    var item_price: Int
    var gift_enable: Int
}
