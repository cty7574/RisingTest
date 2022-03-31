//
//  RecommendViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit

class RecommendViewController: UIViewController {

    @IBOutlet weak var randomCV: UICollectionView!
    @IBOutlet weak var saleCV: UICollectionView!
    var randomItems: RandomResponse? = nil
    var saleItems: SaleResponse? = nil
    static var randomTarget: RandomResult? = nil
    static var saleTarget: SaleResult? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        randomCV.dataSource = self
        randomCV.delegate = self
        
        saleCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        saleCV.dataSource = self
        saleCV.delegate = self
        
        let rr = RandomRequest()
        rr.getRandomData(delegate: self)
        
        let sr = SaleRequest()
        sr.getSaleData(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        RecommendViewController.randomTarget = nil
        RecommendViewController.saleTarget = nil
    }

}

extension RecommendViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    // 섹션별 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == randomCV{
            return randomItems?.result.count ?? 0
        }
        else if collectionView == saleCV{
            return saleItems?.result.count ?? 0
        }
        else{
            return 0
        }
    }
    // 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == randomCV{
            let cellId = String(describing: RandomCollectionViewCell.self)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RandomCollectionViewCell
            
            let target = randomItems!.result[indexPath.item]
            
            cell.itemNameLabel.text = "[" + target.vendor + "] " + target.title
            cell.itemPriceLabel.text = target.title_price.description + "원"
            cell.cellImage.load(URL(string: target.image)!)
            cell.itemIdLabel.text = String(target.post_id)
            
            return cell
        }
        else {
            let cellId = String(describing: SaleCollectionViewCell.self)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SaleCollectionViewCell
            
            let target = saleItems!.result[indexPath.item]
            
            cell.itemNameLabel.text = "[" + target.vendor + "] " + target.title
            cell.originalPriceLabel.text = target.title_price.description + "원"
            cell.cellImage.load(URL(string: target.image)!)
            cell.itemIdLabel.text = String(target.post_id)
            cell.saleLabel.text = String(target.off) + "%"
            cell.salePriceLabel.text = String(Int((1-(Float(target.off)/100)) * Float(target.title_price))) + "원"
            if target.item_list[0].gift_enable == 1{
                cell.presentBtn.isHidden = false
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == randomCV{
            return CGSize(width: 180, height: 280)
        }
        else{
            return CGSize(width: 180, height: 300)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == randomCV{
            RecommendViewController.randomTarget = randomItems!.result[indexPath.item]
        }
        else{
            RecommendViewController.saleTarget = saleItems!.result[indexPath.item]
        }
        
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController else { return }
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
}

extension RecommendViewController {
    func didSuccessGetRandomItems(_ response: RandomResponse) {
        randomItems = response
        randomCV.reloadData()

    }
    
    func didSuccessGetSaleItems(_ response: SaleResponse){
        saleItems = response
        saleCV.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
