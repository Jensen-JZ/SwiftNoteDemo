//
//  ItemsView.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/18.
//

import SwiftUI

struct ItemsView: View {
    @StateObject var noteData = NoteViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 2) {
                        ForEach(noteData.noteItems) { noteItem in
                            // NoteItemView
                            NoteItemView(noteItem: $noteData.noteItems[getIndex(noteItem: noteItem)], noteItems: $noteData.noteItems)
                        }
                    }
                }.navigationTitle("笔记")
                
                // Create a new note
                
//                Button(action: {}) {
//                }
                NavigationLink(destination: NoteView(noteItems: $noteData.noteItems, id: "")) {
                    Text("新建笔记")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(
                            LinearGradient(gradient: .init(colors: [Color(hex: 0xff6a6a), Color(hex: 0xff0000)]), startPoint: .leading, endPoint: .trailing)
                        ).cornerRadius(15)
                }.padding()
            }
        }
    }
    
    func getIndex(noteItem: NoteItem) -> Int {
        return noteData.noteItems.firstIndex { (noteItem1) -> Bool in
            return noteItem.id == noteItem1.id
        } ?? 0
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
