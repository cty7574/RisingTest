//
//  SearchViewController.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/27.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var eggBtn: UIButton!
    @IBOutlet weak var batBtn: UIButton!
    @IBOutlet weak var tangBtn: UIButton!
    @IBOutlet weak var hotBtn1: UIButton!
    @IBOutlet weak var hotBtn2: UIButton!
    @IBOutlet weak var bulBtn: UIButton!
    @IBOutlet weak var milBtn: UIButton!
    @IBOutlet weak var cowBtn: UIButton!
    @IBOutlet weak var grikBtn: UIButton!
    @IBOutlet weak var riceBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recently = [eggBtn, batBtn]
        let recom = [tangBtn, hotBtn1, hotBtn2, bulBtn, milBtn, cowBtn, grikBtn, riceBtn]

        for btn in recently{
            btn?.recentlyBtn()
        }
        for btn in recom{
            btn?.recommendBtn()
        }
        
    }

}

extension UIButton{
    func recentlyBtn(){
        layer.borderColor = UIColor.systemGray5.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 15
    }
    
    func recommendBtn(){
        layer.backgroundColor = UIColor.systemPurple.cgColor
        layer.cornerRadius = 15
    }
}
