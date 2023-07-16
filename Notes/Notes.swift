//
//  Notes.swift
//  Notes
//
//  Created by Student32 on 16/07/2023.
//

import Foundation

import FirebaseFirestore
import FirebaseAuth


class Notes {
    
    var noteArray: [Note] = []
    var db: Firestore!
    
    init(){
        db = Firestore.firestore()
        
    }
    
    func loadData(completed: @escaping () -> ()){
        db.collection("notes").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else{
                print("Error: \(error!.localizedDescription) ")
                return completed()
            }
            self.noteArray = []
            
            for document in querySnapshot!.documents {
                
                let note = Note(dictionary: document.data())
                note.documentID = document.documentID
                self.noteArray.append(note)
            }
            completed()
        }
    }
}
