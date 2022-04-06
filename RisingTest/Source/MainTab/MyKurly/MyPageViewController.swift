//
//  MyPageViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/21.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var userInfoView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    lazy var dataManager = UserInfoDataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "마이컬리"
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        if ViewController.jwt != nil && ViewController.userIdx != 0{
            loginView.isHidden = true
            userInfoView.isHidden = false
            
            dataManager.getUserInfo(delegate: self)
        }
        else{
            loginView.isHidden = false
            userInfoView.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let lvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController else { return }
        
        self.navigationController?.pushViewController(lvc, animated: true)
        
    }
    
    @IBAction func btnModify(_ sender: UIButton){
        guard let cvc = self.storyboard?.instantiateViewController(withIdentifier: "CheckVC") as? CheckViewController else { return }
        
        self.navigationController?.pushViewController(cvc, animated: true)
        
    }

    @IBAction func orderButtonTabbed(_ sender: UIButton) {
        guard let gvc = self.storyboard?.instantiateViewController(withIdentifier: "GetOrderVC") as? GetOrderViewController else { return }
        
        self.navigationController?.pushViewController(gvc, animated: true)
    }
    
    @IBAction func wishButtonTabbed(_ sender: UIButton) {
        guard let wvc = self.storyboard?.instantiateViewController(withIdentifier: "WishListVC") as? WishListViewController else { return }
        
        self.navigationController?.pushViewController(wvc, animated: true)
    }
    
}

extension MyPageViewController{
    func didSuccessUserInfo(_ result: UserResponse){
        ViewController.userInfo = result
        userNameLabel.text = result.result[0].name + "님"
        print(result.result[0].name)
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
