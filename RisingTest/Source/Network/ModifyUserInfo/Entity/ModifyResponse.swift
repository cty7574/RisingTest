//
//  ModifyResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/27.
//

struct ModifyResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: result
}

struct result: Decodable{
    var userIdx: String
}
