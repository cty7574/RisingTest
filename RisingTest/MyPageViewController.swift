//
//  MyPageViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/21.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "마이컬리"
        self.navigationItem.titleView?.tintColor = .white
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let lvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") else { return }
        
        self.navigationController?.pushViewController(lvc, animated: true)
    }

}
