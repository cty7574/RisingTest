//
//  GetOrderViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

import UIKit

class GetOrderViewController: UIViewController {

    @IBOutlet weak var orderCV: UICollectionView!
    var orderResult: [GetOrderResult] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "주문 내역"
        
        orderCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        orderCV.delegate = self
        orderCV.dataSource = self
        
        let or = GetOrderRequest()
        or.getOrderData(delegate: self)
    }

}

extension GetOrderViewController{
    func didSuccessGetOrderData(_ response: [GetOrderResult]){
        orderResult = response
        print("주문내역 load 성공!")
        orderCV.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

extension GetOrderViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return orderResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: GetOrderCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GetOrderCollectionViewCell
        
        let target = orderResult[indexPath.item]
        cell.orderIdLabel.text = String(1203421879310 + indexPath.item)
        cell.itemNameLabel.text = "[" + target.vendor + "]" + target.item_name
        cell.timeLabel.text = target.order_date
        cell.paymentLabel.text = target.pay
        cell.amountLabel.text = String(target.item_price) + "원"
        cell.statusLabel.text = target.status
        
        return cell
    }
    
}
