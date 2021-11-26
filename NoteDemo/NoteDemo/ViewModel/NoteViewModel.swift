//
//  NoteViewModel.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/18.
//

import SwiftUI

class NoteViewModel: ObservableObject {  // modelview.
    
    @Published var noteItems: [NoteItem] = []  // an array that stores NoteItems.
}
