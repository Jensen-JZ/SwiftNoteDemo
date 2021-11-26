//
//  NoteItem.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/18.
//

import SwiftUI

struct NoteItem: Identifiable {  // note model.
    var id = UUID().uuidString  // id.
    var noteTitle: String  // note title.
    var endTime: String  // time of the last modification.
    var content: String  // note content.
    var isSwiped: Bool  // a flag variable is used to determine whether the note item view has been swiped.
    var offset: CGFloat  // swiping distance.
}
