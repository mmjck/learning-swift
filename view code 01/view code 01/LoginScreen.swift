//
//  LoginScreen.swift
//  view code 01
//
//  Created by Jackson Matheus on 08/03/23.
//

import UIKit

class LoginScreen: UIView {
    
    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BGLogin")
        
        return image
    }()
    
    
    lazy var logoAppImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BFLogin")
        
        return image
    }()
    
    
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "BF NFT"
        return label
    }()
    
    
    lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "O marketplace de NFTs da Backfront Academy"
        return label
    }()
    
    
    
    lazy var loginTextField: UITextField = {
        let tf = UITextField()
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(
            string:"Login",
            attributes: [NSAttributedString.Key.foregroundColor:UIColor.white.withAlphaComponent(0.4)
                        ])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        
        
        return tf
        
    }()
    
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(
            string: "Senha",
            attributes: [NSAttributedString.Key.foregroundColor:UIColor.white.withAlphaComponent(0.4)
                        ])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        return tf
        
    }()
    
    
    lazy var recoveryPasswordButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar Senha?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        
        return button
    }()
    
    
    lazy var subLoginview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradient3")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    
    
    lazy var lineWiew: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    
    
    lazy var signInMetamaskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    
    lazy var signInMetamaskImageView: UIView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
        
    }()
    
    
    lazy var signInMetamaskLabel: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Entrar com a Metamask"
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.subImageView)
        self.addSubview(self.logoAppImage)
        self.addSubview(self.loginLabel)
        self.addSubview(self.descriptionLabel)
        
        
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.recoveryPasswordButton)
        
        self.addSubview(self.subLoginview)
        self.addSubview(self.loginButton)
        self.addSubview(self.lineWiew)
        
        self.addSubview(self.signInMetamaskView)
        self.signInMetamaskView.addSubview(self.signInMetamaskImageView)
        self.signInMetamaskView.addSubview(self.signInMetamaskLabel)
        self.configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    
    private func configConstraints () { 
        
        let _bgConstraint: [NSLayoutConstraint] = [
            self.subImageView.leadingAnchor.constraint(equalTo:  self.leadingAnchor),
            self.subImageView.trailingAnchor.constraint(equalTo:  self.trailingAnchor),
            self.subImageView.topAnchor.constraint(equalTo:  self.topAnchor),
            self.subImageView.bottomAnchor.constraint(equalTo:  self.bottomAnchor),
            
        ]
        
        let _logoConstraint: [NSLayoutConstraint] = [
            self.logoAppImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55),
            self.logoAppImage.heightAnchor.constraint(equalToConstant: 108),
            self.logoAppImage.widthAnchor.constraint(equalToConstant: 108),
            self.logoAppImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ]
        
        
        let _labelLoginConstraint: [NSLayoutConstraint] = [
            self.loginLabel.topAnchor.constraint(equalTo: self.logoAppImage.bottomAnchor, constant: 16),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        
        
        let _descriptionLoginConstraint: [NSLayoutConstraint] = [
            self.descriptionLabel.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 4),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ]
        
        
        let _loginTextFieldConstraint: [NSLayoutConstraint] =  [
            self.loginTextField.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 32),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 39)
        ]
        
        
        
        let _passwordextFieldConstraint: [NSLayoutConstraint] =  [
            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 32),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 39)
        ]
        
        
        let _recoveryPasswordButtonConstraint: [NSLayoutConstraint] =  [
            self.recoveryPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 9),
            self.recoveryPasswordButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.recoveryPasswordButton.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        
        let _logginButtonConstraint: [NSLayoutConstraint] =  [
            self.loginButton.topAnchor.constraint(equalTo: self.recoveryPasswordButton.bottomAnchor, constant: 36),
            self.loginButton.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 41)
        ]
        
        let _subLoginConstraint: [NSLayoutConstraint] =  [
            self.subLoginview.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor, constant: 36),
            self.subLoginview.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.subLoginview.topAnchor.constraint(equalTo: self.loginButton.topAnchor),
            self.subLoginview.bottomAnchor.constraint(equalTo: self.loginButton.bottomAnchor),
       ]
        
        
        let _lineViewConstraint: [NSLayoutConstraint] =  [
            self.lineWiew.topAnchor.constraint(equalTo: self.subLoginview.bottomAnchor, constant: 48),
            self.lineWiew.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            self.lineWiew.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            self.lineWiew.heightAnchor.constraint(equalToConstant: 0.5)
        ]
        
        
        
        let _metamaskConstraint : [NSLayoutConstraint] = [
            self.signInMetamaskView.topAnchor.constraint(equalTo: self.lineWiew.bottomAnchor,constant: 48),
            self.signInMetamaskView.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.signInMetamaskView.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.signInMetamaskView.heightAnchor.constraint(equalToConstant: 41),
            
            self.signInMetamaskImageView.leadingAnchor.constraint(equalTo: self.signInMetamaskView.leadingAnchor,constant: 53),
            self.signInMetamaskImageView.centerYAnchor.constraint(equalTo: self.signInMetamaskView.centerYAnchor),
            self.signInMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            self.signInMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            
            self.signInMetamaskLabel.leadingAnchor.constraint(equalTo: self.signInMetamaskImageView.trailingAnchor,constant: 17),
            self.signInMetamaskLabel.centerYAnchor.constraint(equalTo: self.signInMetamaskView.centerYAnchor)
        ]
        
        let allConstraint: [NSLayoutConstraint] =   _bgConstraint +
        _logoConstraint +
        _labelLoginConstraint +
        _descriptionLoginConstraint  +
        _loginTextFieldConstraint +
        _passwordextFieldConstraint +
        _recoveryPasswordButtonConstraint +
        _logginButtonConstraint +
        _subLoginConstraint +
        _lineViewConstraint +
        _metamaskConstraint
        
        NSLayoutConstraint.activate(allConstraint)
    }
    
}
