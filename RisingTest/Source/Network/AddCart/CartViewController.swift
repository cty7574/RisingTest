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
    }
    
    @IBAction func orderBtnTabbed(_ sender: UIButton) {
    }
}

extension CartViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: CartCollectionVC.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CartCollectionVC
        
        return cell
    }
    
    
}
