//
//  LoginDataManager.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/26.
//

import Alamofire

class LoginDataManager{
    func postLogIn(_ parameters: LogInRequest, delegate: LoginViewController) {
        AF.request("https://prod.sosocamp.shop/users/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: LogInResponse.self) { response in
                
                switch response.result {
                    
                case .success(let response):
                    if response.isSuccess {
                        delegate.didSuccessLogIn(response.result.jwt, response.result.userIdx)
                    }
                    else{
                        switch response.code {
                        case 2021: delegate.failedToRequest(message: "ID를 입력해주세요")
                        case 2022: delegate.failedToRequest(message: "비밀번호를 입력해주세요")
                        case 2023: delegate.failedToRequest(message: "ID는 20자리 미만으로 입력해주세요")
                        case 2024: delegate.failedToRequest(message: "비밀번호는 10자리 이상 20자리 미만으로 입력해주세요")
                        case 2025: delegate.failedToRequest(message: "ID는 특수문자 없이 입력해주세요")
                        case 3011: delegate.failedToRequest(message: "ID가 잘못 되었습니다")
                        case 3012: delegate.failedToRequest(message: "비밀번호가 잘못 되었습니다")
                        case 3013: delegate.failedToRequest(message: "비활성화된 계정입니다. 고객센터에 문의해주세요")
                        case 3014: delegate.failedToRequest(message: "탈퇴한 계정입니다. 고객센터에 문의해주세요")
                        case 4000: delegate.failedToRequest(message: "데이터 베이스 에러")
                        default: delegate.failedToRequest(message: "알 수 없는 에러")
                        }
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    delegate.failedToRequest(message: "로그인 실패!")
                }
            
            }
    }
}
