//
//  NoteController.swift
//  Notes
//
//  Created by Corey Sessions on 4/29/19.
//  Copyright © 2019 Corey Sessions. All rights reserved.
//

import Foundation




class NotesController {
    
    init() {
        createNote(withText: "Walk the dog!")
        createNote(withText: "Eat some ice cream!")
        createNote(withText: "Swift is awesome!")
    }
    
    private(set) var notes: [Note] = []
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        
        notes.append(note)
    }
}
