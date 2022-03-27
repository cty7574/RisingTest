//
//  ModifyRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/27.
//

struct ModifyRequest: Encodable{
    var password: String
    var email: String
    var phone: String
    var address: String
    var birthday: String
    var gender: String
}
