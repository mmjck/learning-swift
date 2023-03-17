//
//  UIImageView.swift
//  Tinder
//
//  Created by Jackson Matheus on 10/03/23.
//

import UIKit


extension UIImageView {
    static func photoImageView(named: String? = nil) -> UIImageView {
        let image = UIImageView()
        if let _named = named {
            image.image = UIImage(named: _named)
        }
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }
    
    static func iconCard(named: String) -> UIImageView {
        let image = UIImageView()
       
        image.image = UIImage(named: named)
        image.size(size: .init(width: 60, height: 45))
        image.alpha = 0
        return image
    }
}
