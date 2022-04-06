//
//  WishListCollectionViewCell.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import UIKit

class WishListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var offLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var cellItemBtn: UIButton!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var postIdLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
