//
//  SaleCollectionViewCell.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var presentBtn: UIButton!
    @IBOutlet weak var itemIdLabel: UILabel!
    
    override func awakeFromNib() {
        itemIdLabel.isHidden = true
        presentBtn.isHidden = true
        cartBtn.layer.cornerRadius = 20
        cartBtn.layer.opacity = 0.7
        presentBtn.layer.opacity = 0.8
    }
    
    @IBAction func cartBtnTabbed(_ sender: UIButton) {
    }
    @IBAction func itemBtnTabbed(_ sender: UIButton) {
    }
}
