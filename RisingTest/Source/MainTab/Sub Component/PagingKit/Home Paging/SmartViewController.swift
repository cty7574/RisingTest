//
//  SmartViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/04/01.
//

import UIKit

class SmartViewController: UIViewController {

    @IBOutlet weak var smartCV: UICollectionView!
    var image = ["smart1", "smart2", "smart3", "smart4"]
    var itemName = ["[디너예약 응모권] 미쉐린 1스타 미토우 오마카세 코스요리(4인)" , "[마켓비] 12 NAPLES 트롤리 라이트브라운 (업체배송)", "[메이준뉴트리] NFC 비엣퓨어 100% 노니주스 1L", "[마켓비] 04 TANG 아카시아 원목접이식스툴/협탁 브라운 (업체배송)"]
    var sale = ["100%", "80%", "77%", "75%"]
    var price = ["0원", "94900원", "6854원", "24900원"]
    override func viewDidLoad() {
        super.viewDidLoad()

        smartCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        smartCV.delegate = self
        smartCV.dataSource = self
        smartCV.reloadData()
    }

}

extension SmartViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: SmartCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SmartCollectionViewCell
        
        cell.itemNameLabel.text = itemName[indexPath.item]
        cell.cellImage.image = UIImage(named: image[indexPath.item])
        cell.itemPriceLabel.text = price[indexPath.item]
        cell.percentLael.text = sale[indexPath.item]
        
        return cell
    }
    
    
}
