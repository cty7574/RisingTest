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
    var btnArr: [UIButton] = []
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
    }
    
    @IBAction func clickFemale(_ sender: UIButton) {
        btnMale.tintColor = UIColor.systemGray
        btnFemale.tintColor = UIColor.systemPurple
        btnNone.tintColor = UIColor.systemGray
    }
    
    @IBAction func clickNone(_ sender: UIButton) {
        btnMale.tintColor = UIColor.systemGray
        btnFemale.tintColor = UIColor.systemGray
        btnNone.tintColor = UIColor.systemPurple
    }
    @IBAction func clickedAll(_ sender: UIButton) {
        print(btnAll.state)
        if btnAll.state == UIControl.State.selected{
            for button in btnArr{
                button.isSelect()
            }
        }
        else{
            for button in btnArr{
                button.isCancle()
            }
        }
    }
}

extension UIButton{
    func isSelect(){
        tintColor = UIColor.systemPurple
    }
    
    func isCancle(){
        tintColor = UIColor.systemGray
    }
}
