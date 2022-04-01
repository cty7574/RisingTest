//
//  ModifyDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/27.
//

import Alamofire

class ModifyDataManage{
    func patchUserInfo(_ parameters: ModifyRequest, delegate: ModifyViewController){
        let headers : HTTPHeaders = ["x-access-token" : ViewController.jwt!]
        
        AF.request("https://prod.sosocamp.shop/users/\(ViewController.userIdx)", method: .patch,
        parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: headers)
            .validate()
            .responseDecodable(of: ModifyResponse.self) {
                response in
                
                switch response.result{
                case .success(let response):
                    if response.isSuccess{
                        delegate.didSuccessModify(response.message)
                    }
                    else{
                        switch response.code {
                        case 2041: delegate.failedToRequest(message: "사용자 Index 값을 확인해주세요")
                        case 2042: delegate.failedToRequest(message: "비밀번호는 10자리 이상 20자리 미만으로 입력해주세요")
                        case 2043: delegate.failedToRequest(message: "이메일 형식을 정확하게 입력해주세요")
                        case 3021: delegate.failedToRequest(message: "비활성화된 계정입니다.")
                        case 3022: delegate.failedToRequest(message: "탈퇴된 계정입니다. 고객센터에 문의해주세요")
                        
                        case 4000: delegate.failedToRequest(message: "데이터 베이스 에러")
                        default: delegate.failedToRequest(message: "")
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
