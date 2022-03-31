//
//  ModifyViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/27.
//

import UIKit

class ModifyViewController: UIViewController {
    @IBOutlet weak var birthView: UIView!
    @IBOutlet weak var yearView: UITextField!
    @IBOutlet weak var monthView: UITextField!
    @IBOutlet weak var dateView: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField2: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var noneBtn: UIButton!
    @IBOutlet weak var addressTextField: UITextField!
    var gender: String = "NONE"
    lazy var dataManager = ModifyDataManage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "개인정보 수정"
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem

        birthView.layer.cornerRadius = 5
        birthView.layer.borderColor = UIColor.systemGray5.cgColor
        birthView.layer.borderWidth = 1
        
        yearView.borderStyle = .none
        monthView.borderStyle = .none
        dateView.borderStyle = .none
        
        idTextField.text = ViewController.userInfo?.result[0].user_id
        emailTextField.text = ViewController.userInfo?.result[0].email
        phoneTextField.text = ViewController.userInfo?.result[0].phone
        addressTextField.text = ViewController.userInfo?.result[0].address
        
        let temp = ViewController.userInfo?.result[0].birthday.components(separatedBy: ["-","-"])
        yearView.text = temp![0]
        monthView.text = temp![1]
        dateView.text = temp![2]
        
    }
    
    @IBAction func clickMale(_ sender: UIButton) {
        maleBtn.tintColor = UIColor.systemPurple
        femaleBtn.tintColor = UIColor.systemGray
        noneBtn.tintColor = UIColor.systemGray
        gender = "MALE"
    }
    
    @IBAction func clickFemale(_ sender: UIButton) {
        maleBtn.tintColor = UIColor.systemGray
        femaleBtn.tintColor = UIColor.systemPurple
        noneBtn.tintColor = UIColor.systemGray
        gender = "FEMALE"
    }
    
    @IBAction func clickNone(_ sender: UIButton) {
        maleBtn.tintColor = UIColor.systemGray
        femaleBtn.tintColor = UIColor.systemGray
        noneBtn.tintColor = UIColor.systemPurple
        gender = "NONE"
    }
    
    @IBAction func btnAgree1(_ sender: UIButton) {
        if sender.tintColor == .systemGray{
            sender.tintColor = .systemPurple
        }
        else{
            sender.tintColor = .systemGray
        }
    }
    
    @IBAction func btnAgree2(_ sender: UIButton) {
        if sender.tintColor == .systemGray{
            sender.tintColor = .systemPurple
        }
        else{
            sender.tintColor = .systemGray
        }
    }
    
    @IBAction func btnAgree3(_ sender: UIButton) {
        if sender.tintColor == .systemGray{
            sender.tintColor = .systemPurple
        }
        else{
            sender.tintColor = .systemGray
        }
    }
    
    @IBAction func btnModify(_ sender: UIButton) {
        
        guard let password = oldPasswordTextField.text, password.isExists else{
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        let nPw1 = newPasswordTextField.text ?? ""
        let nPw2 = newPasswordTextField2.text ?? ""
        
        if nPw1 != nPw2{
            self.presentAlert(title: "비밀번호를 확인해주세요")
            return
        }
        
        let email = emailTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        let address = addressTextField.text ?? ""
        
        let birthday = yearView.text! + "-" + monthView.text! + "-" + dateView.text!
        
        let input = ModifyRequest(password: nPw1, email: email, phone: phone, address: address, birthday: birthday, gender: gender)
        
        print(input)
        dataManager.patchUserInfo(input, delegate: self)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func deleteBtnTabbed(_ sender: UIButton) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "DeleteUserVC") as? DeleteUserViewController else { return }
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

extension ModifyViewController {
    func didSuccessModify(_ message: String) {
        self.presentAlert(title: "회원 정보 수정: ",message: message)
//        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MyPageVC") else { return }
//        self.changeRootViewController(rvc)
        
    
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
