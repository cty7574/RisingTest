//
//  CartCollectionVC.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var quantityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indexLabel.isHidden = true
        quantityView.layer.borderWidth = 1
        quantityView.layer.borderColor = UIColor.systemGray4.cgColor
        quantityView.layer.cornerRadius = 5
    }
}
