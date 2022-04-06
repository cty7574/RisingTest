//
//  DetailViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit
import PagingKit

class DetailViewController: UIViewController {
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    var dataSource = [(menu: String, content: UIViewController)]() {
        didSet{
            menuViewController.reloadData()
            contentViewController.reloadData()
        }
    }
    
    lazy var firstLoad: (() -> Void)? = { [weak self, menuViewController, contentViewController] in
        menuViewController?.reloadData()
        contentViewController?.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        menuViewController.register(nib: UINib(nibName: "DetailMenuCell", bundle: nil), forCellWithReuseIdentifier: "DetailMenuCell")
                menuViewController.registerFocusView(nib: UINib(nibName: "DetailFocusView", bundle: nil))
        
        firstLoad?()
        dataSource = makeDataSource()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? PagingMenuViewController {
                menuViewController = vc
                menuViewController.dataSource = self
                menuViewController.delegate = self
            } else if let vc = segue.destination as? PagingContentViewController {
                contentViewController = vc
                contentViewController.dataSource = self
                contentViewController.delegate = self
            }
        }
    
    fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)]{
        let myMenuArray = ["상품설명", "상세정보", "후기", "문의"]
        
        return myMenuArray.map{
            let title = $0
            
            switch title {
            case "상품설명":
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ItemIntroVC") as! ItemIntroViewController
                return (menu: title, content: vc)
            case "상세정보":
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ItemInfoVC") as! ItemInfoViewController
                return (menu: title, content: vc)
            case "후기":
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReviewVC") as! ReviewViewController
                return (menu: title, content: vc)
            case "문의":
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "AskVC") as! AskViewController
                return (menu: title, content: vc)
            default:
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ItemIntroVC") as! ItemIntroViewController
                return (menu: title, content: vc)
            }
        }
    }

}

extension DetailViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "DetailMenuCell", for: index) as! DetailMenuCell
        cell.titleLabel.text = dataSource[index].menu
        return cell
    }
}

extension DetailViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}

extension DetailViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}

extension DetailViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
