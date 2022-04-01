//
//  ReviewViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var reviewBtn: UIButton!
    @IBOutlet weak var reviewCV: UICollectionView!
    @IBOutlet weak var heartBtn: UIButton!
    var randomItem: RandomResult? = nil
    var saleItem: SaleResult? = nil
    var reviewList: [GetReviewResult]? = nil
    static var review: GetReviewResult? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        reviewBtn.layer.borderWidth = 1
        reviewBtn.layer.borderColor = UIColor.systemPurple.cgColor
        reviewBtn.layer.cornerRadius = 5
        
        heartBtn.layer.borderWidth = 1
        heartBtn.layer.borderColor = UIColor.systemGray4.cgColor
        heartBtn.layer.cornerRadius = 5
        
        reviewCV.dataSource = self
        reviewCV.delegate = self
        
        var rr = GetReviewRequest()
        
        if RecommendViewController.randomTarget != nil{
            randomItem = RecommendViewController.randomTarget!
            rr.getReviewData(randomItem!.post_id, delegate: self)
        }
        else if RecommendViewController.saleTarget != nil{
            saleItem = RecommendViewController.saleTarget!
            rr.getReviewData(saleItem!.post_id, delegate: self)
        }
    }

}

extension ReviewViewController{
    func didSuccessGetReviews(_ response: [GetReviewResult]){
        reviewList = response
        reviewCV.reloadData()
    }
}

extension ReviewViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if reviewList == nil{
            return 0
        }
        
        if reviewList!.count < 3{
            return reviewList!.count
        }
        else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: ReviewCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ReviewCollectionViewCell
        
        cell.textLabel.text = reviewList![indexPath.item].title
        cell.nameLabel.text = reviewList![indexPath.item].name
        cell.dayLabel.text = reviewList![indexPath.item].createDate
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ReviewViewController.review = reviewList![indexPath.item]
        
        guard let detailvc = self.storyboard?.instantiateViewController(withIdentifier: "ReviewDetailVC") as? ReviewDetailViewController else { return }
        
        self.navigationController?.pushViewController(detailvc, animated: true)
    }
    
}
