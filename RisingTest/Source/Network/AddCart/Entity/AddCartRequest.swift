//
//  AddCartRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

struct AddCartRequest: Encodable{
    var item_list: [AddCardList]
}

struct AddCardList: Encodable{
    var id: Int
    var quantity: Int
}
