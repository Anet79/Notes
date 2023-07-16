//
//  Note.swift
//  Notes
//
//  Created by Student32 on 16/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class Note{
    
    var title:String
    var des:String
    var date:String
    var postingUserID: String
    var documentID: String
    
    
    var dictionary: [String: Any]{
        return ["title": title, "des": des, "date": date, "postingUserID": postingUserID]
    }
    
    
    init(title: String, des: String, date: String, postingUserID: String, documentID: String) {
        self.title = title
        self.des = des
        self.date = date
        self.postingUserID = postingUserID
        self.documentID = documentID
    }
    
    convenience init(){
        self.init( title: "", des: "", date: "", postingUserID: "", documentID: "")
    }
    
    convenience init(dictionary: [ String: Any]){
        let title = dictionary["title"] as! String? ?? ""
        let des = dictionary["des"] as! String? ?? ""
        let date = dictionary["date"] as! String? ?? ""
        let postingUserID = dictionary["postingUserID"] as! String? ?? ""
        
        self.init( title: title, des:des, date: date, postingUserID: postingUserID, documentID: "")
    }
    
    
    func saveData(completion: @escaping (Bool)->()){
        
        let db = Firestore.firestore()
        
        guard let postingUserID = Auth.auth().currentUser?.uid else {
            
           print("Error : Couldn't save data because we don't have a valid postingUserID")
            return completion(false)
            
        }
        self.postingUserID = postingUserID
        
        let dataToSave: [String: Any] = self.dictionary
        
        if self.documentID == "" {
            var ref: DocumentReference? = nil
            ref = db.collection("notes").addDocument(data: dataToSave){(error) in
                guard error == nil else {
                    print("Error : adding document \(error!.localizedDescription)")
                    return completion(false)
                }
                self.documentID = ref!.documentID
                print(" adding document \(self.documentID)")
                completion(true)
            }
        }else{
            let ref = db.collection("notes").document(self.documentID)
            ref.setData(dataToSave) { (error) in
                guard error == nil else {
                    print("Error : updating document \(error!.localizedDescription)")
                    return completion(false)
                }
                print(" Updated document \(self.documentID)")
                completion(true)
            }
        
    }
        
    }
    
    
}
