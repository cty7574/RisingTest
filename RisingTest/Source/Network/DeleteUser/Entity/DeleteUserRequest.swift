//
//  DeleteUserRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

import Alamofire

class DeleteUserRequest{
    func putDeleteUserData(delegate: DeleteUserViewController){
        let headers : HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        
        AF.request("https://dev.sosocamp.shop/users/\(ViewController.userIdx)",
                   method: .put,
                   parameters: nil,
                   headers: headers)
            .responseDecodable(of: DeleteUserResponse.self){ response in
                switch response.result {
                    
                case .success(let response):
                    if response.isSuccess {
                        delegate.didSuccessDeleteUserInfo()
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    delegate.failedToRequest(message: "회원탈퇴 실패!")
                }
            }
    }
}
