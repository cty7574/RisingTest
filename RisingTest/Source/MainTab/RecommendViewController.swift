//
//  RecommendViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/28.
//

import UIKit

class RecommendViewController: UIViewController {

    @IBOutlet weak var randomCV: UICollectionView!
    var randomItems: RandomResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomCV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        randomCV.dataSource = self
        randomCV.delegate = self
        
        let rr = RandomRequest()
        rr.getRandomData(delegate: self)
    }

}

extension RecommendViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    // 섹션별 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomItems?.result.count ?? 0
    }
    // 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId = String(describing: RandomCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RandomCollectionViewCell
        
        cell.itemNameLabel.text = randomItems?.result[indexPath.item].title
        cell.itemPriceLabel.text = randomItems?.result[indexPath.item].title_price.description
        
        return cell
    }
}

extension RecommendViewController {
    func didSuccessGetItems(_ response: RandomResponse) {
        randomItems = response
        randomCV.reloadData()

    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
