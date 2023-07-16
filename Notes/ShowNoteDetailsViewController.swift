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
    
    var note: Note!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleText.text = note.title
        bodyText.text = note.des
    }
    

  

}
