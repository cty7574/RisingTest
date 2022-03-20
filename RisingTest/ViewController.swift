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
    static var viewController: (UIColor) -> UIViewController = { (color) in
        let vc = UIViewController()
         vc.view.backgroundColor = color
         return vc
     }
     var dataSource = [(menuTitle: "컬리추천", vc: viewController(.red)), (menuTitle: "신상품", vc: viewController(.blue)), (menuTitle: "베스트", vc: viewController(.yellow))]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        menuViewcontroller.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewcontroller.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        
        menuViewcontroller.reloadData()
        contentViewController.reloadData()
        
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
        cell.titleLabel.text = dataSource[index].menuTitle
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
        return dataSource[index].vc
    }
}

extension ViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewcontroller.scroll(index: index, percent: percent, animated: false)
    }
}
