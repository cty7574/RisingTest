//
//  DeleteCartResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

struct DeleteCartResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: DeleteCartResult
}

struct DeleteCartResult: Decodable{
    var item_id: Int
}
