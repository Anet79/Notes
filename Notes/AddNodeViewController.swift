//
//  AddNodeViewController.swift
//  Notes
//
//  Created by Student32 on 15/07/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class AddNodeViewController: UIViewController {
    
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteButtonBack: UIButton!
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var bodyText: UITextField!
    
    var note: Note!
    
    let database = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if note == nil {
            note = Note()
        }
        updateUserInterface()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUserInterface(){
        noteTitle.text=note.title
        bodyText.text = note.des
        
        
    }
    
    func updateFromInterface(){
        note.title = noteTitle.text!
        note.des = bodyText.text!
    }
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        updateFromInterface()
        
        note.saveData { (success) in
            if success {
                
                let HomeScreen = self.storyboard?.instantiateViewController(identifier: "HomeScreenViewController") as! HomeScreenViewController
                                    
                HomeScreen.modalPresentationStyle = .fullScreen


                self.present( HomeScreen, animated: true , completion: nil)
            }else{
                let alert = UIAlertController(title: "Save Faild ", message: "For some reason, the data dont saved", preferredStyle: .alert)
                let defultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(defultAction)

                self.present(alert, animated: true, completion: nil)
            }
        }
        
    
        
        
    }
}
