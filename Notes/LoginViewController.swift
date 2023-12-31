//
//  LoginViewController.swift
//  Notes
//
//  Created by Student32 on 14/07/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pngtree-beautiful-yellow-note-image_1420104")! )

            setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        errorText.alpha=0
    }
    

    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        

            if error != nil{
                self.errorText.text=error!.localizedDescription
                self.errorText.alpha=1
                
                
            }
            else{
                self.openHomeScreen()
                
            }
         
        }
        
    }
    func openHomeScreen(){
        let HomeScreen = storyboard?.instantiateViewController(identifier: "HomeScreenViewController") as! HomeScreenViewController
                            
        HomeScreen.modalPresentationStyle = .fullScreen


        present( HomeScreen, animated: true , completion: nil)

        
    }
    
}
