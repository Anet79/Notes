//
//  LoginViewController.swift
//  Notes
//
//  Created by Student32 on 14/07/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginTapped(_ sender: Any) {
    }
    
}
