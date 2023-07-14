//
//  SignUpViewController.swift
//  Notes
//
//  Created by Student32 on 14/07/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var errorButton: UILabel!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        
        
    }
    
    func setUpElements(){
        errorButton.alpha=0
    }
    
    func validateFields()-> String? {
        
        
        //check that all fields are filled in
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" {
            
            return "Please fill in all fields"
        }
        
        return nil
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let error=validateFields()
        
        if error != nil{
            errorButton.text=error!
            errorButton.alpha=1
        }
        else{
            
            let firstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail:email, password:password) { authResult, error in
                
                if  error != nil{
                    self.errorButton.text="Error creating user"
                    self.errorButton.alpha=1
                }
                else{
                    let db=Firestore.firestore()
                    
                    db.collection("users").addDocument(data: [
                        "firstName": firstName,
                        "lastName":lastName,
                        "email": email,
                        "password": password,
                        "uid":authResult!.user.uid
                    ]) { err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        }
                    }
                  
                    self.openHomeScreen()
                }
              
               
            }
           
        }
        
        
    }
    
    func openHomeScreen(){
        let HomeScreen = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                            
        HomeScreen.modalPresentationStyle = .fullScreen


        present( HomeScreen, animated: true , completion: nil)

        
    }
}
