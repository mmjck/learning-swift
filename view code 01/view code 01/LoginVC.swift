//
//  ViewController.swift
//  view code 01
//
//  Created by Jackson Matheus on 08/03/23.
//

import UIKit

class LoginVC: UIViewController {

    var screen: LoginScreen?
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func loadView() {
        self.screen = LoginScreen()
        self.view = self.screen
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

