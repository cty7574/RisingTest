//
//  CartViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartCV: UICollectionView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var sendLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    var cartItems: [GetCartResult] = []
    var checkBuy: [Bool] = []
    var removeIndex: Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "장바구니"
        
        addressLabel.text = "배송지를 입력해주세요"
        sendLabel.text = ""
        if ViewController.jwt != nil{
            addressLabel.text = ViewController.userInfo?.result[0].address
            sendLabel.text = "샛별배송"
        }

        cartCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cartCV.dataSource = self
        cartCV.delegate = self
        
        let cr = GetCartRequest()
        cr.getCartData(delegate: self)
    }
    
    @IBAction func orderBtnTabbed(_ sender: UIButton) {
    }
}

extension CartViewController{
    func didSuccessGetCart(_ response: [GetCartResult]){
        cartItems = response
        cartCV.reloadData()
        
        for _ in 0...cartItems.count{
           checkBuy.append(false)
        }
    }
    
    func didSuccessDeleteCart(){
        self.presentAlert(title: "삭제 성공!")
        cartItems.remove(at: removeIndex!)
        removeIndex = nil
        cartCV.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

extension CartViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: CartCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CartCollectionViewCell
        
        cell.tag = indexPath.item + 100
        cell.checkBtn.tag = indexPath.item + 200
        cell.minusBtn.tag = indexPath.item + 300
        cell.plusBtn.tag = indexPath.item + 400
        cell.cancleBtn.tag = indexPath.item + 500
        
        let target = cartItems[indexPath.item]
        cell.indexLabel.text = String(indexPath.item)
        cell.itemNameLabel.text = "[" + target.vendor + "]" + target.item_name
        cell.originalPriceLabel.text = String(target.item_price * target.quantity) + "원"
        cell.salePriceLabel.text = String(Int((1-(Float(target.off)/100)) * Float(target.item_price * target.quantity))) + "원"
        cell.quantityLabel.text = String(target.quantity)
        cell.itemImageView.load(URL(string: target.image)!)
        
        cell.checkBtn.addTarget(self, action: #selector(checkBtnTabbed), for: .touchUpInside)
        cell.cancleBtn.addTarget(self, action: #selector(cancleBtnTabbed), for: .touchUpInside)
        cell.minusBtn.addTarget(self, action: #selector(minusBtnTabbed), for: .touchUpInside)
        cell.plusBtn.addTarget(self, action: #selector(plusBtnTabbed), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkBtnTabbed(sender: UIButton){
        let index = sender.tag - 200
        
        if sender.tintColor == UIColor.systemPurple{
            sender.tintColor = UIColor.systemGray
            checkBuy[index] = false
        }
        else{
            sender.tintColor = UIColor.systemPurple
            checkBuy[index] = true
        }
    }
    
    @objc func minusBtnTabbed(sender: UIButton){
        let index = sender.tag - 300
        let cell = self.view.viewWithTag(index + 100) as! CartCollectionViewCell
        var quantity = Int(cell.quantityLabel.text!) ?? 0
        
        if quantity != 1{
            let target = cartItems[index]
            quantity = quantity - 1
            
            cell.quantityLabel.text = String(quantity)
            cell.originalPriceLabel.text = String(target.item_price * quantity) + "원"
            cell.salePriceLabel.text = String(Int((1-(Float(target.off)/100)) * Float(target.item_price * quantity))) + "원"
            
            cartItems[index].quantity = quantity
        }
    }
    
    @objc func plusBtnTabbed(sender: UIButton){
        let index = sender.tag - 400
        let cell = self.view.viewWithTag(index + 100) as! CartCollectionViewCell
        var quantity = Int(cell.quantityLabel.text!) ?? 0
        let target = cartItems[index]
        
        quantity = quantity + 1
        cell.quantityLabel.text = String(quantity)
        cell.originalPriceLabel.text = String(target.item_price * quantity) + "원"
        cell.salePriceLabel.text = String(Int((1-(Float(target.off)/100)) * Float(target.item_price * quantity))) + "원"
        
        cartItems[index].quantity = quantity
    }
    
    @objc func cancleBtnTabbed(sender: UIButton){
        let index = sender.tag - 500
        let target = cartItems[index]
        
        let dc = DeleteCartRequest()
        dc.deleteCartData(target.item_id, delegate: self)
        removeIndex = index
        
        cartCV.reloadData()
    }
    
}


