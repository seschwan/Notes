//
//  NotesViewController.swift
//  Notes
//
//  Created by Corey Sessions on 4/29/19.
//  Copyright © 2019 Corey Sessions. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NoteTableViewCellDelegate {
    
    
    
    let notesController = NotesController()

    @IBOutlet weak var notesTableView: UITableView!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.dataSource   = self
        notesTableView.delegate     = self
        
    }
    
    @IBAction func saveNoteBtnTapped(_ sender: UIButton) {
        guard let text = self.noteTextView.text else { return }
        
        notesController.createNote(withText: text)
        self.noteTextView.text = nil
        self.notesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        guard let noteCell = cell as? NoteTableViewCell else { return cell }
        let note = notesController.notes[indexPath.row]
        noteCell.note = note
        noteCell.delegate = self
        
        
        return cell
    }
    
    func shareNote(for cell: NoteTableViewCell) {
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }

    
    
}
