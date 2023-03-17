//
//  MatchVC.swift
//  Tinder
//
//  Created by Jackson Matheus on 13/03/23.
//

import UIKit



class MatchVC: UIViewController, UITextFieldDelegate {
    
    var _user: User? {
        didSet{
            if let _user = _user {
                _photoImageView.image = UIImage(named: _user.imageUrl) 
                _labelView.text = " \(_user.name) curtiu você"
                
            }
        }
    }
    
    
    let _photoImageView: UIImageView = .photoImageView(named: "pessoa-1")
    let _likeImageView: UIImageView = .photoImageView(named:  "icone-like")
    let _labelView: UILabel = .textBoldLabel(10, textColor: .white, numberOfLines: 1)
    
    
    
    let _messageView : UITextField = {
        let _input:  UITextField =  UITextField()
        _input.translatesAutoresizingMaskIntoConstraints = false
        _input.heightAnchor.constraint(equalToConstant: 44).isActive = true
        _input.text = "Diga algo legal"
        _input.backgroundColor = .white
        _input.layer.cornerRadius = 8
        _input.textColor = .darkText
        _input.returnKeyType = .go
        
        
        _input.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        _input.leftViewMode = .always
        _input.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        _input.rightViewMode = .always
        return _input
    }()
    
    let _buttonGoBackView: UIButton = {
        let _view: UIButton =  UIButton()
        _view.setTitle("Voltar", for: .normal)
        _view.setTitleColor(.white, for: .normal)
        _view.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return _view
        
    }()
   
    
    let _buttonView: UIButton = {
        let _view: UIButton =  UIButton()
        _view.setTitle("Enviar", for: .normal)
        _view.setTitleColor(UIColor(red: 62/255, green: 163/255, blue: 255/255, alpha: 1), for: .normal)
        _view.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return _view
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardShow), name: UIResponder.keyboardDidShowNotification, object: nil )
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardHide), name: UIResponder.keyboardWillHideNotification, object: nil )
        
        view.addSubview(_photoImageView)
        _photoImageView.preencherSuperview()
        
        
        _labelView.textAlignment = .center
        _messageView.delegate = self
        
        let _gradient = CAGradientLayer()
        _gradient.frame = view.frame
        _gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        
        
        _photoImageView.layer.addSublayer(_gradient)
        _buttonView.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        _messageView.addSubview(_buttonView)
        
       
        _buttonView.preencher(top: _messageView.topAnchor, leading: nil, trailing: _messageView.trailingAnchor, bottom: _messageView.bottomAnchor,
                              padding: .init(top: 0, left: 32, bottom: 0, right: 16))
        
        _likeImageView.translatesAutoresizingMaskIntoConstraints = false
        _likeImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        _likeImageView.contentMode = .scaleAspectFit
        
        
        
        _buttonGoBackView.addTarget(self, action: #selector(goBack), for:.touchUpInside)
        
        let _stackView = UIStackView(arrangedSubviews: [ _likeImageView, _labelView, _messageView, _buttonGoBackView])
        _stackView.axis = .vertical
        _stackView.spacing = 16
        
        self.view.addSubview(_stackView)
        _stackView.preencher(top: nil,
                             leading: self.view.leadingAnchor,
                             trailing: self.view.trailingAnchor,
                             bottom: self.view.bottomAnchor,
                             padding: .init(top: 0, left: 32, bottom: 46, right: 32))
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func sendMessage(){
        
        if let _message = self._messageView.text {
            print(_message)
        }
        
    }
    
    @objc func keyBoardHide(notificaton: NSNotification){
        if let duration = notificaton.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            
            UIView.animate(withDuration: duration) {
                self.view.frame = UIScreen.main.bounds
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyBoardShow(notificaton: NSNotification){
        if let keyboarSize = (notificaton.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if let duration = notificaton.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
                
                UIView.animate(withDuration: duration) {
                    self.view.frame = CGRect(x: UIScreen.main.bounds.origin.x,
                                             y: UIScreen.main.bounds.origin.y, width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - keyboarSize.height )
                    
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sendMessage()
        return true
    }
    
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
}
