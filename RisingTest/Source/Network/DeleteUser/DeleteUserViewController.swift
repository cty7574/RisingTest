//
//  DeleteUserViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

import UIKit

class DeleteUserViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    lazy var dr = DeleteUserRequest()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "개인정보 수정"
    }

    @IBAction func deleteBtnTabbed(_ sender: UIButton) {
        guard let password = passwordTextField.text, password.isExists else{
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        dr.putDeleteUserData(delegate: self)
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension DeleteUserViewController{
    func didSuccessDeleteUserInfo(){
        ViewController.jwt = nil
        ViewController.userInfo = nil
        self.presentAlert(title: "회원 탈퇴가 완료되었습니다.")
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
