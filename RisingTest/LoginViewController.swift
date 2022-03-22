//
//  LoginViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var signBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signBtn.layer.borderWidth = 1
        signBtn.layer.borderColor = UIColor.systemPurple.cgColor
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.navigationItem.title = "로그인"
    }
    @IBAction func btnSignup(_ sender: UIButton) {
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") else { return }
        
        self.navigationController?.pushViewController(svc, animated: true)
    }

}
