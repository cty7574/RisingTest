//
//  ReviewDetailViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

import UIKit

class ReviewDetailViewController: UIViewController {

    @IBOutlet weak var vendorLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var reviewTitleLabel: UILabel!
    @IBOutlet weak var reviewTextLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    var randomItem: RandomResult? = nil
    var saleItem: SaleResult? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "상품 후기 상세"
        
        let review = ReviewViewController.review
        
        if RecommendViewController.randomTarget != nil{
            randomItem = RecommendViewController.randomTarget!
            
            vendorLabel.text = "[" + randomItem!.vendor + "]"
            itemTitleLabel.text = randomItem!.title
            itemNameLabel.text = randomItem!.item_list[0].item_name
        }
        else if RecommendViewController.saleTarget != nil{
            saleItem = RecommendViewController.saleTarget!
            
            vendorLabel.text = saleItem!.vendor
            itemTitleLabel.text = saleItem!.title
            itemNameLabel.text = saleItem!.item_list[0].item_name
        }
        
        reviewTitleLabel.text = review!.title
        reviewTextLabel.text = review!.content
        dayLabel.text = review!.createDate
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ReviewViewController.review = nil
    }
    
}
