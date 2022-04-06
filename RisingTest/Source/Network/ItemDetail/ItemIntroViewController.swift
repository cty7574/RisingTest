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
    @IBOutlet weak var wishBtn: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var vendorLabel: UILabel!
    var randomItem: RandomResult? = nil
    var saleItem: SaleResult? = nil
    var post_id = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wishBtn.layer.borderWidth = 1
        wishBtn.layer.borderColor = UIColor.systemGray.cgColor
        wishBtn.layer.cornerRadius = 5
        
        orderBtn.layer.cornerRadius = 5
    
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
        post_id = input.post_id
    }
    
    func insertSaleData(_ input: SaleResult){
        itemNameLabel.text = input.title
        itemIntroLabel.text = input.intro
        itemPriceLabel.text = String(Int((1-(Float(input.off)/100)) * Float(input.title_price))) + "원"
        mainImage.load(URL(string: input.image)!)
        vendorLabel.text = "[" + input.vendor + "]"
        post_id = input.post_id
    }

    @IBAction func orderBtnTabbed(_ sender: UIButton) {
        guard let avc = self.storyboard?.instantiateViewController(withIdentifier: "AddCartVC") as? AddCartViewController else { return }
        
        self.navigationController?.pushViewController(avc, animated: true)
    }
    
    @IBAction func wishBtnTabbed(_ sender: UIButton) {
        let wm = AddWishDataManager()
        let input = AddWishRequest(post_id: String(post_id))
        wm.postAddWish(input, delegate: self)
        print("post id: ",post_id)
        
        wishBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        wishBtn.tintColor = UIColor.systemRed
    }
    
}

extension ItemIntroViewController{
    func didSuccessAddWishLists(){
        print("장바구니 추가 성공!")
    }
}
