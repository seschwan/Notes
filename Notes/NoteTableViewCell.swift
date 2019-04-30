//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Corey Sessions on 4/29/19.
//  Copyright © 2019 Corey Sessions. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var noteLabel: UILabel!
    
    var note: Note? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let note = self.note else { return }
        self.noteLabel.text = note.text
    }

    @IBAction func shareBtnTapped(_ sender: UIButton) {
        
    }
    
    

}
