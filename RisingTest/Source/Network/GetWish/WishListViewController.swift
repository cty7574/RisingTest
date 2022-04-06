//
//  WishListViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/06.
//

import UIKit

class WishListViewController: UIViewController {

    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var wishCV: UICollectionView!
    var wishList: [GetWishResult] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "찜한 상품"

        wishCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        wishCV.delegate = self
        wishCV.dataSource = self
        
        let get = GetWishRequest()
        get.getWishList(delegate: self)
        
    }
}

extension WishListViewController{
    func didSuccessGetWishLists(_ response: [GetWishResult]){
        wishList = response
        wishCV.reloadData()
        print("찜한상품 load 성공!")
        quantityLabel.text = "전체 " + String(wishList.count) + "개"
    }
    
    func failedToRequest() {
        wishList = []
        wishCV.reloadData()
        
        quantityLabel.text = "전체 " + String(wishList.count) + "개"
    }
    
    func didSuccessDeleteWishLists(){
        self.presentAlert(title: "삭제 성공!")
        
        let get = GetWishRequest()
        get.getWishList(delegate: self)
    }
}

extension WishListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wishList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: WishListCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WishListCollectionViewCell
        
        cell.deleteBtn.layer.borderColor = UIColor.systemGray.cgColor
        cell.deleteBtn.layer.borderWidth = 1
        cell.deleteBtn.layer.cornerRadius = 5
        cell.cartBtn.layer.borderColor = UIColor.systemPurple.cgColor
        cell.cartBtn.layer.borderWidth = 1
        cell.cartBtn.layer.cornerRadius = 5
        
        let index = indexPath.item
        let target = wishList[index]
        
        cell.tag = 100 + index
        cell.deleteBtn.tag = 200 + index
        cell.cartBtn.tag = 300 + index
        cell.cellItemBtn.tag = 400 + index
        
        cell.indexLabel.text = String(index)
        cell.indexLabel.isHidden = true
        cell.postIdLabel.text = String(target.post_id)
        cell.postIdLabel.isHidden = true
        
        cell.cellImage.load(URL(string: target.post_image)!)
        cell.itemNameLabel.text = "[" + target.vendor + "] " + target.title
        cell.offLabel.text = String(target.off) + "%"
        cell.originPriceLabel.text = String(target.title_price) + "원"
        cell.salePriceLabel.text = String(Int((1-(Float(target.off)/100)) * Float(target.title_price))) + "원"
        
        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnTabbed), for: .touchUpInside)
        
        return cell
    }
    
    @objc func deleteBtnTabbed(sender: UIButton){
        let index = sender.tag - 200
        let deleteRequest = DeleteWishRequest()
        
        deleteRequest.deleteWishList(wishList[index].post_id, delegate: self)
    }
}
