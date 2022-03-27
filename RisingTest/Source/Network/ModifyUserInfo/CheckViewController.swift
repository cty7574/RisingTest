//
//  CheckViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/27.
//

import UIKit

class CheckViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        idTextField.text = ViewController.userInfo!.result[0].user_id
    }
    
    @IBAction func btnOK(_ sender: UIButton) {
        guard let id = idTextField.text, id.isExists else{
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        guard let password = pwTextField.text, password.isExists else{
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        guard let mvc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyVC") as? ModifyViewController else { return }
        
        self.navigationController?.pushViewController(mvc, animated: true)
        
        
    }

}
