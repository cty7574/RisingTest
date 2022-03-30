//
//  RandomCollectionViewCell.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//
import UIKit

class RandomCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var itemIdLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var cartBtn: UIButton!
    
    override func awakeFromNib() {
        itemIdLabel.isHidden = true
        cartBtn.layer.cornerRadius = 20
        cartBtn.layer.opacity = 0.7
    }
    
    
    @IBAction func itemTabbed(_ sender: UIButton) {
    }
    @IBAction func cartBtnTabbed(_ sender: UIButton) {
    }
}
