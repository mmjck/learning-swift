//
//  Loading.swift
//  Tinder
//
//  Created by Jackson Matheus on 13/03/23.
//

import UIKit

class Loading: UIView{
    
    let _loading : UIView = {
       let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = UIColor(red: 218/255, green: 99/255, blue: 111/255, alpha: 1)
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
        
        return view
    }()
    
    let _profile : UIImageView = {
       let _image = UIImageView()
        _image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        _image.layer.cornerRadius = 50
        _image.layer.borderWidth = 5
        _image.layer.borderColor = UIColor.white.cgColor
        _image.clipsToBounds = true
        _image.image = UIImage(named: "perfil")
        return _image
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(_loading)
        self.addSubview(_profile)

        _loading.center = center
        _profile.center = center

        self.customAnimation()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError(" init (coder:) has not been impo" )
    }
    
    
    
    
    func customAnimation(){
        UIView.animate(withDuration: 1.5, animations: {
            self._loading.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            self._loading.center = self.center
            self._loading.layer.cornerRadius = 125
            self._loading.alpha = 0.3
        }){ (_) in
            
            
                self._loading.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                self._loading.center = self.center
                self._loading.layer.cornerRadius = 50
                self._loading.alpha = 1
                        
                self.customAnimation()
            
        }
    }
}
