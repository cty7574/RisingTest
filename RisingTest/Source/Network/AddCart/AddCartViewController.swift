//
//  AddCartViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit

class AddCartViewController: UIViewController {

    @IBOutlet weak var cartCV: UICollectionView!
    var randomItem: RandomResult? = nil
    var saleItem: SaleResult? = nil
    var itemList: [AddCardList]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "장바구니 담기"
        
        if RecommendViewController.randomTarget != nil{
            randomItem = RecommendViewController.randomTarget!
        }
        else if RecommendViewController.saleTarget != nil{
            saleItem = RecommendViewController.saleTarget!
        }
        
        cartCV.dataSource = self
        cartCV.delegate = self
        cartCV.reloadData()
        
    }
    
}

extension AddCartViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if randomItem != nil{
            return randomItem?.item_list.count ?? 0
        }
        else if saleItem != nil{
            return saleItem?.item_list.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: AddCartCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AddCartCollectionViewCell
        
        cell.buttonView.layer.cornerRadius = 5
        cell.buttonView.layer.borderWidth = 1
        cell.buttonView.layer.borderColor = UIColor.systemGray5.cgColor
        
        if randomItem != nil{
            let target = randomItem!.item_list[indexPath.item]
            
            cell.itemNameLabel.text = target.item_name
            cell.salePriceLabel.text = target.item_price.description + "원"
        }
        else if saleItem != nil{
            let target = saleItem!.item_list[indexPath.item]
            
            cell.itemNameLabel.text = target.item_name
            cell.originalPriceLabel.text = target.item_price.description + "원"
            cell.salePriceLabel.text = String(Int((1-(Float(saleItem!.off)/100)) * Float(target.item_price))) + "원"
        }
        
        return cell
    }
    
    
}
