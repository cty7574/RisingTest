//
//  BestViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit

class BestViewController: UIViewController {
    let image = ["best1", "best2", "best3", "best4"]
    let name = ["[연세우유 x 마켓컬리] 전용목장우유 900mL", "[kurly's] 국산콩 두부 300g", "[KF365] 김구원선생 국내산 무농약 콩나물 300g", "[다향오리] 훈제오리 150g"]
    let price = ["1970원", "1900원", "900원", "2980원"]
//
    @IBOutlet weak var bestCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        bestCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bestCV.delegate = self
        bestCV.dataSource = self
    }

}

extension BestViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: BestCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BestCollectionViewCell
        
        cell.itemName.text = name[indexPath.item]
        cell.itemImage.image = UIImage(named: image[indexPath.item])
        cell.itemPrice.text = price[indexPath.item]
        
        return cell
    }
    
    
}
