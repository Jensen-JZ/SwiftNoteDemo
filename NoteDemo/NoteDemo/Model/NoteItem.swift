//
//  NoteItem.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/18.
//

import SwiftUI

struct NoteItem: Identifiable {
    var id = UUID().uuidString
    var noteTitle: String
    var endTime: String
    var content: String
    var isSwiped: Bool
    var offset: CGFloat
}
