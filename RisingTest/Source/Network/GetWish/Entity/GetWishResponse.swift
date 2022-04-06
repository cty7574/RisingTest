//
//  GetWishResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

struct GetWishResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [GetWishResult]
}

struct GetWishResult: Decodable{
    var post_id: Int
    var post_image: String
    var vendor: String
    var title: String
    var title_price: Int
    var off: Int
}
