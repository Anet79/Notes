//
//  ViewController.swift
//  Notes
//
//  Created by Student32 on 14/07/2023.
//

import UIKit


class ViewController: UIViewController {

    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpTapped(_ sender: Any) {
        
        
        let signUpScreen = storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
                            
        signUpScreen.modalPresentationStyle = .fullScreen


        present( signUpScreen, animated: true , completion: nil)

    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let loginScreen = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                            
        loginScreen.modalPresentationStyle = .fullScreen


        present( loginScreen, animated: true , completion: nil)
    }
    
}

