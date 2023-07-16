//
//  HomeScreenViewController.swift
//  Notes
//
//  Created by Student32 on 16/07/2023.
//

import UIKit

class HomeScreenViewController: UIViewController {

  
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var notes: Notes!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        notes = Notes()
        
        tableView.delegate=self
        tableView.dataSource=self
    }
    
    
   
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        notes.loadData {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNoteDetailsViewController" {
            let destination = segue.destination as! ShowNoteDetailsViewController
            
            
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.note = notes.noteArray[selectedIndexPath.row]
        }
    }
    
    
  
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let addNoteScreen = storyboard?.instantiateViewController(identifier: "AddNoteScreenViewController") as! AddNoteScreenViewController
                            
        addNoteScreen.modalPresentationStyle = .fullScreen


        present( addNoteScreen, animated: true , completion: nil)
        
    }
    


 
    


        
  
    
    
}


extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes.noteArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as!
        NoteTableViewCell
        
        //cell.text
        cell.titleText?.text = note.title
        cell.bodyText?.text = note.des
        cell.dateText?.text = note.date
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
    



