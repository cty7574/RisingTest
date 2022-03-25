//
//  SignUpViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var duplCheck: UIButton!
    @IBOutlet weak var birthView: UIView!
    @IBOutlet weak var yearView: UITextField!
    @IBOutlet weak var monthView: UITextField!
    @IBOutlet weak var dateView: UITextField!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnNone: UIButton!
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnAgree1: UIButton!
    @IBOutlet weak var btnAgree2: UIButton!
    @IBOutlet weak var btnAgree3: UIButton!
    @IBOutlet weak var btnAgree4: UIButton!
    @IBOutlet weak var btnSms: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnAge: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTextField2: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    lazy var dataManager: SignUpDataManager = SignUpDataManager()
    var gender: String = "NONE"
    var btnArr: [UIButton] = []
    var btnCheck: [Bool] = [false, false, false, false, false, false, false, false]
    override func viewDidLoad() {
        super.viewDidLoad()

        btnArr = [btnAll, btnAgree1, btnAgree2, btnAgree3, btnAgree4, btnSms, btnEmail, btnAge]
        
        self.navigationItem.title = "회원가입"
        
        duplCheck.layer.cornerRadius = 5
        duplCheck.layer.borderWidth = 1
        duplCheck.layer.borderColor = UIColor.systemPurple.cgColor
        
        birthView.layer.cornerRadius = 5
        birthView.layer.borderColor = UIColor.systemGray5.cgColor
        birthView.layer.borderWidth = 1
        
        yearView.borderStyle = .none
        monthView.borderStyle = .none
        dateView.borderStyle = .none
    }
    
    @IBAction func clickMale(_ sender: UIButton) {
        btnMale.tintColor = UIColor.systemPurple
        btnFemale.tintColor = UIColor.systemGray
        btnNone.tintColor = UIColor.systemGray
        gender = "MALE"
    }
    
    @IBAction func clickFemale(_ sender: UIButton) {
        btnMale.tintColor = UIColor.systemGray
        btnFemale.tintColor = UIColor.systemPurple
        btnNone.tintColor = UIColor.systemGray
        gender = "FEMALE"
    }
    
    @IBAction func clickNone(_ sender: UIButton) {
        btnMale.tintColor = UIColor.systemGray
        btnFemale.tintColor = UIColor.systemGray
        btnNone.tintColor = UIColor.systemPurple
        gender = "NONE"
    }
    
    @IBAction func clickedAll(_ sender: UIButton) {
        var i = 0
        let check = !btnCheck[0]
        
        if check {
            for button in btnArr{
                button.isSelect()
                btnCheck[i] = check
                i += 1
            }
        }
        else {
            for button in btnArr{
                button.isCancle()
                btnCheck[i] = check
                i += 1
            }
        }
    }
    @IBAction func clickedBtn1(_ sender: UIButton) {
        btnAgree1.changeTint()
        btnCheck[1] = !btnCheck[1]
    }
    @IBAction func clickedBtn2(_ sender: UIButton) {
        btnAgree2.changeTint()
        btnCheck[2] = !btnCheck[2]
    }
    @IBAction func clickedBtn3(_ sender: UIButton) {
        btnAgree3.changeTint()
        btnCheck[3] = !btnCheck[3]
    }
    @IBAction func clickedBtn4(_ sender: UIButton) {
        btnAgree4.changeTint()
        btnCheck[4] = !btnCheck[4]
    }
    @IBAction func clickedSms(_ sender: UIButton) {
        btnSms.changeTint()
        btnCheck[5] = !btnCheck[5]
    }
    @IBAction func clickedEmail(_ sender: UIButton) {
        btnEmail.changeTint()
        btnCheck[6] = !btnCheck[6]
    }
    @IBAction func clickedBtnAge(_ sender: UIButton) {
        btnAge.changeTint()
        btnCheck[7] = !btnCheck[7]
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let id = idTextField.text, id.isExists else{
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        guard let password = passwordTextField.text, password.isExists else{
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        guard let password2 = passwordTextField2.text, password2.isExists else {
            self.presentAlert(title: "비밀번호 확인을 입력해주세요")
            return
        }
        if password != password2 {
            self.presentAlert(title: "동일한 비밀번호를 입력해주세요")
        }
        guard let name = nameTextField.text, name.isExists else{
            self.presentAlert(title: "이름을 입력해주세요")
            return
        }
        guard let email = emailTextField.text, email.isExists else{
            self.presentAlert(title: "이메일을 입력해주세요")
            return
        }
        guard let phone = phoneTextField.text, phone.isExists else {
            self.presentAlert(title: "휴대폰 번호를 입력해주세요")
            return
        }
        guard let address = adressTextField.text, address.isExists else {
            self.presentAlert(title: "주소를 입력해주세요")
            return
        }
        guard let year = yearTextField.text, year.isExists else {
            self.presentAlert(title: "생년월일을 입력해주세요")
            return
        }
        guard let month = monthTextField.text, month.isExists else {
            self.presentAlert(title: "생년월일을 입력해주세요")
            return
        }
        guard let date = dateTextField.text, date.isExists else {
            self.presentAlert(title: "생년월일을 입력해주세요")
            return
        }
        let birthday = year + "-" + month + "-" + date
        
        if btnCheck[1] != true || btnCheck[2] != true || btnCheck[7] != true{
            self.presentAlert(title: "약관에 동의해주세요")
            return
        }
        
        let input = SignUpRequest(id: id, password: password, name: name, email: email, phone: phone, address: address, birthday: birthday, gender: gender)
        
        print(input)
        
        dataManager.postSignUp(input, delegate: self)
        
    }
    
}

extension SignUpViewController {
    func didSuccessSignUp(_ userIdx: Int) {
        self.presentAlert(title: "회원가입을 성공하였습니다. userID: ",message: String(userIdx))
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

extension UIButton{
    func changeTint(){
        if tintColor == UIColor.systemGray{
            isSelect()
        }
        else{
            isCancle()
        }
    }
    
    func isSelect(){
        tintColor = UIColor.systemPurple
    }
    
    func isCancle(){
        tintColor = UIColor.systemGray
    }
}
