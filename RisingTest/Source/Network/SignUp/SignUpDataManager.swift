//
//  SignUpDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/25.
//

import Alamofire

class SignUpDataManager {
    func postSignUp(_ parameters: SignUpRequest, delegate: SignUpViewController) {
        AF.request("https://dev.sosocamp.shop/users", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: SignUpResponse.self) { response in
                
                switch response.result {
                    
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess {
                        delegate.didSuccessSignUp(response.message)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2001: delegate.failedToRequest(message: "ID를 입력해주세요")
                        case 2002: delegate.failedToRequest(message: "비밀번호를 입력해주세요")
                        case 2003: delegate.failedToRequest(message: "이름을 입력해주세요")
                        case 2004: delegate.failedToRequest(message: "이메일을 입력해주세요")
                        case 2005: delegate.failedToRequest(message: "휴대폰 번호를 입력해주세요")
                        case 2006: delegate.failedToRequest(message: "ID는 20자리 미만으로 입력해주세요")
                        case 2007: delegate.failedToRequest(message: "비밀번호는 10자리 이상 20자리 미만으로 입력해주세요")
                        case 2008: delegate.failedToRequest(message: "이름은 10자리 미만으로 입력해주세요")
                        case 2009: delegate.failedToRequest(message: "ID는 특수문자 없이 입력해주세요")
                        case 2010: delegate.failedToRequest(message: "이름은 특수문자 없이 입력해주세요")
                        case 2011: delegate.failedToRequest(message: "이메일 형식을 정확하게 입력해주세요")
                        case 3001: delegate.failedToRequest(message: "중복된 ID입니다")
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
