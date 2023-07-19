//
//  HomeViewController.swift
//  Notes
//
//  Created by Student32 on 14/07/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class HomeViewController: UIViewController  {
 
    
 
    

    @IBOutlet weak var AddButton: UIButton!
    
    @IBOutlet weak var tableList: UITableView!
    

    
    var notes: Notes!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        notes = Notes()
        
        tableList.delegate=self
        tableList.dataSource=self
    }
    
    
   
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        notes.loadData {
            self.tableList.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNoteDetailsViewController" {
            let destination = segue.destination as! ShowNoteDetailsViewController
            
            
            let selectedIndexPath = tableList.indexPathForSelectedRow!
            destination.note = notes.noteArray[selectedIndexPath.row]
        }
    }
    
    
  
    
    


    @IBAction func AddButtonTapped(_ sender: Any) {
        
        
//        let addNoteScreen = storyboard?.instantiateViewController(identifier: "AddNoteViewController") as! AddNodeViewController
//                            
//        addNoteScreen.modalPresentationStyle = .fullScreen
//
//
//        present( addNoteScreen, animated: true , completion: nil)
        
        
    }
    


        
  
    
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes.noteArray[indexPath.row]
        let cell = tableList.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        
        cell.textLabel?.text=note.title
        cell.textLabel?.text=note.des
        return cell
    }
}









