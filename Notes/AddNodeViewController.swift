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
    
    let database = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        
        let title = noteTitle.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let body = bodyText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //        guard let currentUserUID=Auth.auth().currentUser?.uid else { return }
        //
        //        database.collection("notes").document(currentUserUID).collection("notes").addDocument(data: ["title" : title,"body": body])
        
        
        // Assuming you have already configured Firebase in your project
        
        
        
        // Retrieve the current user's UID
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            
            // Handle the case when the user is not logged in or UID is unavailable
            
            return
            
        }
        
        
        
        
        
        
        // Reference to the user's document
        
        let userDocumentRef = database.collection("notes").document(currentUserUID)
        
        
        
        // Create a new note document within the user's document
        
        let newNoteDocumentRef = userDocumentRef.collection("note").document()
        
        
        
        // Define the data for the note
        
        let noteData: [String: Any] = [
            
            "title":title,
            
            "content": body
            
        ]
        
        
        
        // Set the data for the note in the newly created note document
        
        newNoteDocumentRef.setData(noteData) { error in
            
            if let error = error {
                
                // Handle the error
                
                print("Error saving note: \(error.localizedDescription)")
                
            } else {
                
                // Note saved successfully
                
                print("Note saved successfully!")
                
            }
            
            
        }
        
        
    }
}
