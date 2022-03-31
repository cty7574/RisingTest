//
//  ReviewCollectionViewCell.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell{
  
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var rankButton: UIButton!
    
    override func awakeFromNib() {
        rankButton.layer.cornerRadius = 10
        rankButton.layer.borderColor = UIColor.systemPurple.cgColor
        rankButton.layer.borderWidth = 1
    }
}
