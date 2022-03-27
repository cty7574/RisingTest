//
//  SignUpRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/25.
//

struct SignUpRequest: Encodable{
    var id: String
    var password: String
    var name: String
    var email: String
    var phone: String
    var address: String
    var birthday: String
    var gender: String
}
