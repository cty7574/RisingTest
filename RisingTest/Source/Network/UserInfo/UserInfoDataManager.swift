//
//  UserInfoDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/26.
//

import Alamofire

class UserInfoDataManager{
    func getUserInfo(delegate: MyPageViewController){
        let headers : HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        
        AF.request("https://prod.sosocamp.shop/users/\(ViewController.userIdx)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .responseDecodable(of: UserResponse.self){ response in
                switch response.result {
                
                case .success(let response):
                    if response.isSuccess {
                        delegate.didSuccessUserInfo(response)
                    }
                    else{
                        switch response.code {
                        case 2031: delegate.failedToRequest(message: "사용자 Index 값을 확인해주세요")
                        case 4000: delegate.failedToRequest(message: "데이터 베이스 에러")
                        default: delegate.failedToRequest(message: "알 수 없는 에러")
                        }
                        
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
