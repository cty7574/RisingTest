//
//  ItemInfoViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit

class ItemInfoViewController: UIViewController {

    @IBOutlet weak var imageCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageCV.dataSource = self
        imageCV.delegate = self
        imageCV.reloadData()
    }

}

extension ItemInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if RecommendViewController.randomTarget != nil{
            return RecommendViewController.randomTarget?.item_list.count ?? 0
        }
        else if RecommendViewController.saleTarget != nil{
            return RecommendViewController.saleTarget?.item_list.count ?? 0
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: ItemInfoCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemInfoCollectionViewCell
    
        if RecommendViewController.randomTarget != nil{
            let target = RecommendViewController.randomTarget!.item_list[indexPath.item]
            cell.itemImage.load(URL(string: target.item_image)!)
            cell.itemNameLabel.text = target.item_name
        }
        else if RecommendViewController.saleTarget != nil{
            let target = RecommendViewController.saleTarget!.item_list[indexPath.item]
            cell.itemImage.load(URL(string: target.item_image)!)
            cell.itemNameLabel.text = target.item_name
        }
        
        return cell
    }
    
    
}
