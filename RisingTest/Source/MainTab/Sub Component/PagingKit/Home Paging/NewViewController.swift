//
//  NewViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit

class NewViewController: UIViewController {
    let image = ["new1", "new2", "new3", "new4"]
    let name = ["[자연마을] 과일 주스 8종 (100mL X 6팩)", "[유기방아] 간식떡 2종 (냉동)", "[디너예약 응모권] 미쉐린 1스타 미토우 오마카세 코스요리 (4인)", "[니코하몽] 이베리코 초리조 슬라이스"]
    let price = ["5800원", "3810원", "0원", "6800원"]

    @IBOutlet weak var newCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        newCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        newCV.delegate = self
        newCV.dataSource = self
        newCV.reloadData()
    }

}

extension NewViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: NewCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewCollectionViewCell
        
        cell.itemName.text = name[indexPath.item]
        cell.itemImage.image = UIImage(named: image[indexPath.item])
        cell.price.text = price[indexPath.item]
        
        return cell
    }
    
    
}
