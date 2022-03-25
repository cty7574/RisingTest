//
//  LogInResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/25.
//

struct LogInResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoginResult
}

struct LoginResult: Decodable{
    var jwt: String
}
