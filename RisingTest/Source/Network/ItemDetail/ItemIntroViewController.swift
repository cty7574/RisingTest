//
//  ItemIntroViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit

class ItemIntroViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemIntroLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var vendorLabel: UILabel!
    var randomItem: RandomResult? = nil
    var saleItem: SaleResult? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        if RecommendViewController.randomTarget != nil{
            randomItem = RecommendViewController.randomTarget!
            insertRandomData(randomItem!)
        }
        else if RecommendViewController.saleTarget != nil{
            saleItem = RecommendViewController.saleTarget!
            insertSaleData(saleItem!)
        }
    }
    
    func insertRandomData(_ input: RandomResult){
        itemNameLabel.text = input.title
        itemIntroLabel.text = input.intro
        itemPriceLabel.text = String(input.title_price) + "원"
        mainImage.load(URL(string: input.image)!)
        vendorLabel.text = "[" + input.vendor + "]"
    }
    
    func insertSaleData(_ input: SaleResult){
        itemNameLabel.text = input.title
        itemIntroLabel.text = input.intro
        itemPriceLabel.text = String(Int((1-(Float(input.off)/100)) * Float(input.title_price))) + "원"
        mainImage.load(URL(string: input.image)!)
        vendorLabel.text = "[" + input.vendor + "]"
    }

    @IBAction func orderBtnTabbed(_ sender: UIButton) {
        guard let avc = self.storyboard?.instantiateViewController(withIdentifier: "AddCartVC") as? AddCartViewController else { return }
        
        self.navigationController?.pushViewController(avc, animated: true)
    }
}
