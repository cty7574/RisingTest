//
//  DeleteUserResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

struct DeleteUserResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: DeleteUserResult
}

struct DeleteUserResult: Decodable{
    var userIdx: Int
    var status: String
}
