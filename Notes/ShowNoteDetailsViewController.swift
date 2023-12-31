//
//  ShowNoteDetailsViewController.swift
//  Notes
//
//  Created by Student32 on 16/07/2023.
//

import UIKit

class ShowNoteDetailsViewController: UIViewController {
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var bodyText: UITextView!
    
    var Title: String?
    
    var body: String?
    
    
    
    
    
    var note: Note!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        titleText.text = Title
        bodyText.text = body
    }
    

    @IBAction func DoneTapped(_ sender: Any) {
        
        let HomeScreen = self.storyboard?.instantiateViewController(identifier: "HomeScreenViewController") as! HomeScreenViewController
                            
        HomeScreen.modalPresentationStyle = .fullScreen


        self.present( HomeScreen, animated: true , completion: nil)
    }
    

}
