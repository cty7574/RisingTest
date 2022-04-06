//
//  DeleteWishResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

struct DeleteWishResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: DeleteWishResult
}

struct DeleteWishResult: Decodable{
    var post_id: Int
}
