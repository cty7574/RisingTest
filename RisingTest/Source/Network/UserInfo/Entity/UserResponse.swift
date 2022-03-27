//
//  UserResponse.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/26.
//

struct UserResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [UserResult]
}

struct UserResult: Decodable{
    var user_id: String
    var name: String
    var email: String
    var phone: String
    var address: String
    var birthday: String
    var gender: String
    var status: String
}
