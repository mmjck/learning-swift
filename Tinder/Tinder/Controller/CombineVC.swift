//
//  CombineVC.swift
//  Tinder
//
//  Created by Jackson Matheus on 09/03/23.
//

import UIKit

enum Action {
    case like
    case deslike
    case superLike
}


class CombineVC: UIViewController {
    var users : [User] = []
    
    
    let _profileButton: UIButton = .iconMenu(named:"icone-perfil")
    let _chatButton: UIButton = .iconMenu(named:"icone-chat")
    let _logoButton: UIButton = .iconMenu(named: "icone-logo")
    
    
    let deslikeButton :UIButton = .iconFooter(named: "icone-deslike")
    let superlikeButton :UIButton = .iconFooter(named: "icone-superlike")
    let likeButton :UIButton = .iconFooter(named: "icone-like")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.systemGroupedBackground
        
        
        let _loading = Loading(frame: view.frame)
        self.view.insertSubview(_loading, at: 0)
        
        self.addHeader()
        self.addFooter()
        self.fetchUsers()
        
    }

    func fetchUsers()  {
        UserService.shared.searchUser {
            (_users, err) in
            if let currentUser = _users {
                DispatchQueue.main.async {
                    self.users = currentUser
                    self.addCard()
                    

                }
            }
        }
    }
}



extension CombineVC {
    
    func addHeader(){
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow}
        let _top = window?.safeAreaInsets.top ?? 44
        
        let stackView =  UIStackView(arrangedSubviews: [_profileButton, _logoButton, _chatButton])
        stackView.distribution = .equalCentering
        self.view.addSubview(stackView)
        
        stackView.preencher(top: self.view.topAnchor, leading: self.view.leadingAnchor, trailing: self.view.trailingAnchor, bottom: nil, padding: .init(top: _top, left: 16, bottom: 0, right: 16))
    }
    func addFooter(){
        let stackView =  UIStackView(arrangedSubviews: [UIView(), deslikeButton, superlikeButton, likeButton, UIView()])
        stackView.distribution = .equalSpacing
        self.view.addSubview(stackView)
    
        stackView.preencher(top: nil, leading: self.view.leadingAnchor, trailing: self.view.trailingAnchor, bottom: self.view.bottomAnchor, padding: .init(top: 0, left: 16, bottom: 34, right: 16))
        
        
        deslikeButton.addTarget(self, action: #selector(deslikeClick), for: .touchUpInside )
        likeButton.addTarget(self, action: #selector(likeClick), for: .touchUpInside )
        superlikeButton.addTarget(self, action: #selector(superLikeClick), for: .touchUpInside )

    }
}



extension CombineVC {
    
    func verifyMatch(user: User){
        if user.match {
            let _matchVC = MatchVC()
            _matchVC._user = user
            _matchVC.view.backgroundColor = UIColor.red
            _matchVC.modalPresentationStyle = .fullScreen
            
            self.present(_matchVC, animated: true, completion: nil)
        }
        
    }
    
    func visualizeDetails (currentUser: User) {
        let _detailsVC =  DetailVC()
        _detailsVC.view.backgroundColor = .red
        _detailsVC.modalPresentationStyle = .fullScreen
        self.present(_detailsVC, animated: true, completion: nil)
    }
    
    
    func removeCard(card: UIView){
        card.removeFromSuperview()
        self.users = self.users.filter( {(_user) -> Bool in return _user.id != card.tag})
    }
    
    
  
    
    func addCard (){
        for _user in users {
            let card = CombineCardView()
            print(_user)
            card.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width - 21, height: self.view.bounds.height * 0.6)
            
            card.center = view.center
            card.user = _user
            card.tag = _user.id
            card.callback = {(data) in
                print(data)
                self.visualizeDetails(currentUser: data)
            }
            
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handlerCard))
            card.addGestureRecognizer(gesture)
            view.insertSubview(card, at: 1)
        }
        
        
    }
}




extension CombineVC {
    
    @objc  func superLikeClick(){
        self.animateCard(rotateAngle: 0, action: .superLike)
    }
    
    @objc  func deslikeClick(){
        self.animateCard(rotateAngle: -0.4, action: .deslike)
    }
    
    @objc  func likeClick(){
        self.animateCard(rotateAngle: 0.4, action: .like)
    }
    
    
    func animateCard(rotateAngle: CGFloat, action: Action){
        
        if let _user = self.users.first {
            for view in self.view.subviews {
                if view.tag == _user.id {
                    if let _card = view as? CombineCardView {
                        let _center: CGPoint
                        var _like: Bool = false
                        
                        switch action {
                        case .like:
                                _center = CGPoint(x: _card.center.x + self.view.bounds.width, y: _card
                                    .center.y + 50)
                                _like = true
                            case .superLike:
                                _center = CGPoint(x: _card.center.x, y: _card.center.y - self.view.bounds.height)
                                _like = true

                            case .deslike:
                                _center = CGPoint(x: _card.center.x - self.view.bounds.width, y: _card
                                    .center.y + 50)
                                
                             
                        
                        }
                        
                    
                        UIView.animate(withDuration: 1.3,
                            animations: {
                            _card.center = _center
                            _card.transform  = CGAffineTransform(rotationAngle: rotateAngle)
                            
                            _card.deslikeImageView.alpha = _like == false ? 1:0
                            _card.likeImageView.alpha = _like == true ? 1:0
                            
                        }) { (_) in
                            
                            
                            if _like {
                              self.verifyMatch(user: _user)
                            }
                             self.removeCard(card: _card)}
                    }
                }
            }
        }
    }
    @objc  func handlerCard (_ gesture: UIPanGestureRecognizer){
        if let card = gesture.view  as?CombineCardView{
            let point = gesture.translation(in: view)
            
            UIView.animate(withDuration: 0.2){
                card.center = CGPoint(x: self.view.center.x + point.x, y: self.view.center.y + point.y)
            }
            
            
            let rotationAngule = point.x / self.view.bounds.width * 0.4
            
            if point.x > 0 {
                card.likeImageView.alpha = rotationAngule * 5
                card.deslikeImageView.alpha = 0

            }else {
                card.deslikeImageView.alpha = rotationAngule * 5 * -1
                card.likeImageView.alpha = 0

            }
            
            
            
            if card.center.x > self.view.bounds.width + 50 {
                self.animateCard(rotateAngle: rotationAngule, action: .like)
                return
            }
            if card.center.x < (-50){
                self.animateCard(rotateAngle: rotationAngule, action: .deslike)
                return 
            }

            card.transform = CGAffineTransform(rotationAngle: rotationAngule)

            
            if gesture.state == .ended {
                UIView.animate(withDuration: 0.2){
                    card.center = self.view.center
                    card.transform = .identity
                    
                    
                    card.likeImageView.alpha = 0
                    card.deslikeImageView.alpha = 0
                }
                
            }
        }
    }
}
