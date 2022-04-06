//
//  FixReviewViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import UIKit

class FixReviewViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewTitleTextField: UITextField!
    @IBOutlet weak var reviewContentTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "후기 수정"
        
    }

    @IBAction func fixBtnTabbed(_ sender: UIButton) {
    }
    
}
