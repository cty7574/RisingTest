//
//  SignUpResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/25.
//

struct SignUpResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: SignupResult
}

struct SignupResult: Decodable{
    var userIdx: Int
}
