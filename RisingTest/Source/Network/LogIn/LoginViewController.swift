//
//  LoginViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var pwTextField: UITextField!
    lazy var dataManager: LoginDataManager = LoginDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signBtn.layer.borderWidth = 1
        signBtn.layer.borderColor = UIColor.systemPurple.cgColor
        
        // 백버튼 색상 변경
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        // 네비게이션 title
        self.navigationItem.title = "로그인"
        
        }
    @IBAction func btnSignup(_ sender: UIButton) {
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") else { return }
        
        self.navigationController?.pushViewController(svc, animated: true)
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let id = idTextField.text, id.isExists else{
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        guard let password = pwTextField.text, password.isExists else{
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        let input = LogInRequest(id: id, password: password)
        
        dataManager.postLogIn(input, delegate: self)
    }
    
}

extension LoginViewController {
    func didSuccessLogIn(_ token: String,_ userIdx: Int) {
        ViewController.jwt = token
        ViewController.userIdx = userIdx
        
        print("Login Success! jwt: ", ViewController.jwt!)
        print("userIdx: ", userIdx)
        
        self.navigationController?.popViewController(animated: true)
        //popToRootViewController(animated: <#T##Bool#>)
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
