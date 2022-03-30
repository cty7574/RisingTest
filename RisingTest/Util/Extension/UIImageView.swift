//
//  File.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/30.
//

import UIKit

extension UIImageView{
    func load(_ url: URL){
        if let data = try? Data(contentsOf: url){
            if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
