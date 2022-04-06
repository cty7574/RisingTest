//
//  AddReviewViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import UIKit

class AddReviewViewController: UIViewController {

    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var reviewTitleTextField: UITextField!
    @IBOutlet weak var reviewContentTextView: UITextView!
    static var itemTitle = ""
    static var postId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "상품 후기"

        reviewContentTextView.layer.borderColor = UIColor.lightGray.cgColor
        reviewContentTextView.layer.borderWidth = 1
        reviewContentTextView.layer.cornerRadius = 5
        
        itemTitleLabel.text = AddReviewViewController.itemTitle
    }
    
    @IBAction func submitBtnTabbed(_ sender: UIButton) {
        guard let title = reviewTitleTextField.text, title.isExists else{
            self.presentAlert(title: "제목을 입력해주세요")
            return
        }
        guard let content = reviewContentTextView.text, content.isExists else{
            self.presentAlert(title: "내용을 입력해주세요")
            return
        }
        
        let input = AddReviewRequest(item_id: AddReviewViewController.postId, title: title, content: content)
        
        let dataManager = AddReviewDataManager()
        dataManager.postAddReview(input, delegate: self)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AddReviewViewController.itemTitle = ""
        AddReviewViewController.postId = 0
    }

}

extension AddReviewViewController{
    func didSuccessAddReview(){
        self.presentAlert(title: "리뷰 등록 성공!!")
        self.navigationController?.popViewController(animated: true)
    }
}
