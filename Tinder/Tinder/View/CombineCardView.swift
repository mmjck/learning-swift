//
//  CombineCardView.swift
//  Tinder
//
//  Created by Jackson Matheus on 09/03/23.
//

import UIKit


class CombineCardView: UIView {
    
    var user: User?  {
        didSet {
            if let _user = user {
                print(_user)
                imageView.image = UIImage(named: _user.imageUrl)
                nameLabel.text = _user.name
                idadeLabel.text = String(_user.age)
                phraseLabel.text = _user.phrase
                
            }
        }
    }
    
    let imageView: UIImageView = .photoImageView()
    let nameLabel : UILabel = .textBoldLabel(32, textColor: .white)
    let likeImageView: UIImageView = .iconCard(named: "card-like")
    let deslikeImageView: UIImageView = .iconCard(named: "card-deslike")
    
    let idadeLabel : UILabel = .textLabel(32, textColor: .white)
    let phraseLabel : UILabel = .textLabel(16, textColor: .white, numberOfLines: 2)
    
    
    
    var callback: ((User) -> Void)?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
        
        
        nameLabel.addShadow()
        idadeLabel.addShadow()
        phraseLabel.addShadow()
        
        self.addSubview(imageView)
        self.addSubview(deslikeImageView)
        deslikeImageView.preencher(top: topAnchor, leading: nil, trailing:trailingAnchor , bottom: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        
        
        self.addSubview(likeImageView)
        likeImageView.preencher(top: topAnchor, leading: leadingAnchor, trailing:nil , bottom: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
     
        
        let infoStackView = UIStackView(arrangedSubviews: [nameLabel, idadeLabel, UIView() ])
        infoStackView.spacing = 12
        
        
        
        
        let stackView = UIStackView(arrangedSubviews: [infoStackView, phraseLabel])
        stackView.distribution = .fillEqually
        stackView.axis  = .vertical
        
        self.addSubview(stackView)
        
        stackView.preencher(
            top: nil,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor,
            bottom: self.bottomAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
        imageView.preencherSuperview()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showClick))
        stackView.isUserInteractionEnabled = true
        stackView.addGestureRecognizer(tap)
         
    }
    
    @objc func showClick(){
        if let _user = self.user {
            self.callback?(_user)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
