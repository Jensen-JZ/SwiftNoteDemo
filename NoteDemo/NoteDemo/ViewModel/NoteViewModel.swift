//
//  NoteViewModel.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/18.
//

import SwiftUI

class NoteViewModel: ObservableObject {
    
    @Published var noteItems: [NoteItem] = [
        NoteItem(noteTitle: "热烈庆祝中华人民共和国...", endTime: "2021-11-18 16:44:32", content: "热烈庆祝中华人民共和国成立70周年，这70年来，我们经历了...", isSwiped: false, offset: 0),
        NoteItem(noteTitle: "We all Know th...", endTime: "2021-11-18 17:09:45", content: "We all Know that Bill Gates is a very handsome and cool Geek...", isSwiped: false, offset: 0),
        NoteItem(noteTitle: "欢迎Hennessy教授访问我...", endTime: "2021-11-18 19:00:09", content: "欢迎Hennessy教授访问我校，John L. Hennessy教授1999年出生于美国纽约，毕业于石溪大学...", isSwiped: false, offset: 0)
    ]
    
    @Published var noteItem: NoteItem = NoteItem(noteTitle: "", endTime: "", content: "", isSwiped: false, offset: 0)
    
    func createNote() -> Bool {
        noteItems.append(NoteItem(noteTitle: "", endTime: "", content: "", isSwiped: false, offset: 0))
        return true
    }

        
}
