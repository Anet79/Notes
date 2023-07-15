//
//  HomeViewController.swift
//  Notes
//
//  Created by Student32 on 14/07/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class HomeViewController: UIViewController ,UITableViewDataSource {
 
    
 
    

    @IBOutlet weak var AddButton: UIButton!
    
    @IBOutlet weak var tableList: UITableView!
    
    let database = Firestore.firestore()
    
    var notes=[Note]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readDataFromFromDb()
        
//        tableList.delegate=self
//        tableList.dataSource=self
    }
    
    
    func readDataFromFromDb(){
        // Retrieve the current user's UID
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            
            // Handle the case when the user is not logged in or UID is unavailable
            
            return
            
        }
        // Reference to the user's document
        
        let userDocumentRef = database.collection("users").document(currentUserUID)
        
        
        
        // Reference to the notes collection within the user's document
        
        let notesCollectionRef = userDocumentRef.collection("notes")
        
        
        
        // Fetch the documents within the notes collection
        
        notesCollectionRef.getDocuments { (snapshot, error) in
            
            if let error = error {
                
                // Handle the error
                
                print("Error retrieving notes: \(error.localizedDescription)")
                
                return
                
            }
            
            
            
            guard let documents = snapshot?.documents else {
                
                // Handle the case when there are no notes
                
                print("No notes found")
                
                return
                
            }
            
            
            
            // Loop through each note document
            
            for document in documents {
                
                // Extract the data from each note document
                
                let noteData = document.data()
                
                let noteTitle = noteData["title"] as? String ?? ""
                
                let noteContent = noteData["content"] as? String ?? ""
                
                
               let note=Note(title: noteTitle, des: noteContent, date: "17/7/2023")
                self.notes.append(note)
               // if let row= self.notes.count-1
                
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableList.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        
        //cell.textInputContextIdentifier.
        
        return cell
    }
    
    
    

    @IBAction func AddButtonTapped(_ sender: Any) {
        
        
        let addNoteScreen = storyboard?.instantiateViewController(identifier: "AddNoteViewController") as! AddNodeViewController
                            
        addNoteScreen.modalPresentationStyle = .fullScreen


        present( addNoteScreen, animated: true , completion: nil)
        
        
    }
    


        
  
    
    
}








class Note{
    
    var title:String
    var des:String
    var date:String
    
    init(title: String, des: String, date: String) {
        self.title = title
        self.des = des
        self.date = date
    }
    
    
}
