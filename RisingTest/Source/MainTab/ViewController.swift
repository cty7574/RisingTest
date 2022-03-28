//
//  ViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/19.
//

import UIKit
import PagingKit

class ViewController: UIViewController {
    
    var menuViewcontroller: PagingMenuViewController!
    var contentViewController: PagingContentViewController!

    static var jwt: String? = nil
    static var userIdx: Int = 0
    static var userInfo : UserResponse? = nil
    
    var dataSource = [(menu: String, content: UIViewController)]() {
        didSet{
            menuViewcontroller.reloadData()
            contentViewController.reloadData()
        }
    }
    
    lazy var firstLoad: (() -> Void)? = { [weak self, menuViewcontroller, contentViewController] in
        menuViewcontroller?.reloadData()
        contentViewController?.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
        //
        
        menuViewcontroller.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewcontroller.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        
        firstLoad?()
        dataSource = makeDataSource()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let vc = segue.destination as? PagingMenuViewController{
            menuViewcontroller = vc
            menuViewcontroller.dataSource = self
            menuViewcontroller.delegate = self
        } else if let vc = segue.destination as? PagingContentViewController{
            contentViewController = vc
            contentViewController.dataSource = self
            contentViewController.delegate = self
        }
    }
    
    fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)]{
        let myMenuArray = ["컬리추천", "신상품", "베스트"]
        
        return myMenuArray.map{
            let title = $0
            
            switch title {
            case "컬리추천":
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "RecommendVC") as! RecommendViewController
                return (menu: title, content: vc)
            case "신상품":
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewVC") as! NewViewController
                return (menu: title, content: vc)
            case "베스트":
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "BestVC") as! BestViewController
                return (menu: title, content: vc)
            default:
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "RecommendVC") as! RecommendViewController
                return (menu: title, content: vc)
            }
        }
    }
}

extension ViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menu
        return cell
    }
}

extension ViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}

extension ViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}

extension ViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewcontroller.scroll(index: index, percent: percent, animated: false)
    }
}
//
