//
//  AddCartCollectionViewCell.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit

class AddCartCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var buttonView: UIView!
    
     override func awakeFromNib() {
         super.awakeFromNib()
         indexLabel.isHidden = true
         
    }
    @IBAction func minusBtnTabbed(_ sender: UIButton) {
        if quantityLabel.text != "0"{
            var temp = Int(quantityLabel.text!)
            temp! -= 1
            let index = Int(indexLabel.text!) ?? 0
            
            quantityLabel.text = temp!.description
            AddCartViewController.itemList[index].quantity = temp ?? 0
            
        }
    }
    @IBAction func plusBtnTabbed(_ sender: UIButton) {
        var temp = Int(quantityLabel.text!)
        temp! += 1
        let index = Int(indexLabel.text!) ?? 0
        
        quantityLabel.text = temp!.description
        AddCartViewController.itemList[index].quantity = temp ?? 0
        
    }

}
