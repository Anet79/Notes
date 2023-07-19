//
//  AddNoteScreenViewController.swift
//  Notes
//
//  Created by Student32 on 17/07/2023.
//

import UIKit

class AddNoteScreenViewController: UIViewController {
    
    @IBOutlet weak var bodyText: UILabel!
    
    @IBOutlet weak var TitleText: UILabel!
    
    
    @IBOutlet weak var DoneButton: UIButton!
    
    var note: Note!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.TitleText.text = "Enter Your Title"
        self.bodyText.text = "Note Body"
        
        
        if note == nil {
            note = Note()
        }
        updateUserInterface()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUserInterface(){
        TitleText.text=note.title
        bodyText.text = note.des
        
        
    }
    
    func updateFromInterface(){
        note.title = TitleText.text!
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
