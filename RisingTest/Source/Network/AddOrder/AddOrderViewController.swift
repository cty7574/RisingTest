//
//  AddOrderViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

import UIKit

class AddOrderViewController: UIViewController {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var creditBtn: UIButton!
    @IBOutlet weak var easyBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var againBtn: UIButton!
    @IBOutlet weak var agreeBtn: UIButton!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var kakaoBtn: UIButton!
    var pay = ""
    var agree = false
    var basketIds: [Int] = []
    var presentName = ""
    var sum: Int = 0
    var check: [Bool] = [false, false, false, false]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "주문서"
        
        kakaoBtn.layer.cornerRadius = 10
        kakaoBtn.layer.borderColor = UIColor.systemYellow.cgColor
        kakaoBtn.layer.borderWidth = 1
        
        creditBtn.layer.cornerRadius = 10
        creditBtn.layer.borderColor = UIColor.systemGray5.cgColor
        creditBtn.layer.borderWidth = 1
        
        easyBtn.layer.cornerRadius = 10
        easyBtn.layer.borderColor = UIColor.systemGray5.cgColor
        easyBtn.layer.borderWidth = 1
        
        phoneBtn.layer.cornerRadius = 10
        phoneBtn.layer.borderColor = UIColor.systemGray5.cgColor
        phoneBtn.layer.borderWidth = 1
        
        basketIds = CartViewController.basketList
        presentName = CartViewController.itemName
        sum = CartViewController.sum
        
        CartViewController.basketList = []
        CartViewController.itemName = ""
        CartViewController.sum = 0
        
        if basketIds.count == 1{
            itemNameLabel.text = presentName
        }
        else{
            itemNameLabel.text = presentName + " 등 " + String(basketIds.count) + "개"
        }
        userInfoLabel.text = ViewController.userInfo!.result[0].name + ", " + ViewController.userInfo!.result[0].phone
        addressLabel.text = ViewController.userInfo!.result[0].address
        sumLabel.text = String(sum) + "원"
    }

    @IBAction func againBtnTabbed(_ sender: UIButton) {
        if againBtn.tintColor == UIColor.systemPurple{
            againBtn.tintColor = UIColor.systemGray
        }
        else{
            againBtn.tintColor = UIColor.systemPurple
        }
    }
    @IBAction func kakaoBtnTabbed(_ sender: UIButton) {
        if !check[0]{
            kakaoBtn.backgroundColor = UIColor.systemYellow
            kakaoBtn.tintColor = UIColor.black
            pay = "KAKAOPAY"
        }
        else{
            kakaoBtn.backgroundColor = UIColor.white
            kakaoBtn.tintColor = UIColor.yellow
            pay = ""
        }
        check[0] = !check[0]
    }
    @IBAction func creditBtnTabbed(_ sender: UIButton) {
        if !check[1]{
            creditBtn.tintColor = UIColor.white
            creditBtn.backgroundColor = UIColor.systemPurple
            pay = "CREDITCARD"
        }
        else{
            creditBtn.tintColor = UIColor.black
            creditBtn.backgroundColor = UIColor.white
            pay = ""
        }
        check[1] = !check[1]
    }
    @IBAction func easyBtnTabbed(_ sender: UIButton) {
        if !check[2]{
            easyBtn.tintColor = UIColor.white
            easyBtn.backgroundColor = UIColor.systemPurple
            pay = "EASYPAY"
        }
        else{
            easyBtn.tintColor = UIColor.black
            easyBtn.backgroundColor = UIColor.white
            pay = ""
        }
        check[2] = !check[2]
    }
    @IBAction func phoneBtnTabbed(_ sender: UIButton) {
        if !check[3]{
            phoneBtn.tintColor = UIColor.white
            phoneBtn.backgroundColor = UIColor.systemPurple
            pay = "PHONE"
        }
        else{
            phoneBtn.tintColor = UIColor.black
            phoneBtn.backgroundColor = UIColor.white
            pay = ""
        }
        check[3] = !check[3]
    }
    @IBAction func agreeBtnTabbed(_ sender: UIButton) {
        if agreeBtn.tintColor == UIColor.systemPurple{
            agreeBtn.tintColor = UIColor.systemGray
            agree = false
        }
        else{
            agreeBtn.tintColor = UIColor.systemPurple
            agree = true
        }
    }
    @IBAction func orderBtnTabbed(_ sender: UIButton) {
        if pay == ""{
            self.presentAlert(title: "결제 수단을 선택해주세요")
            return
        }
        else if agree == false{
            self.presentAlert(title: "결제 진행 필수 동의 필요!")
            return
        }
        
        let input = AddOrderRequest(orderList: basketIds, pay: pay)
        let dataManager = AddOrderDataManager()
        
        dataManager.postAddOrderData(input, delegate: self)
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddOrderViewController{
    func didSuccessAddOrder(){
        self.presentAlert(title: "주문 성공!")
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
