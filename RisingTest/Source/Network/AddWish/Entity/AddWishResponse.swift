//
//  AddWishResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

struct AddWishResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [AddWishResult]
}

struct AddWishResult: Decodable{
    var watchlist_id: Int
}
