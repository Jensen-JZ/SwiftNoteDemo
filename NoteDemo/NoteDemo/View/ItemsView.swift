//
//  ItemsView.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/18.
//

import SwiftUI

struct ItemsView: View {  // view.
    @StateObject var noteData = NoteViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {  // ScrollView.
                    LazyVStack(spacing: 2) {
                        ForEach(noteData.noteItems) { noteItem in  // show the items view.
                            NoteItemView(noteItem: $noteData.noteItems[getItemIndex(noteItem: noteItem)], noteItems: $noteData.noteItems)
                        }
                    }
                }.navigationTitle("笔记")  // set the title of this view.
                
                // Create a new note
                NavigationLink(destination: NoteView(noteItems: $noteData.noteItems, id: "")) {  // navigate into a new note view.
                    Text("新建笔记")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(
                            LinearGradient(gradient: .init(colors: [Color(hex: 0xff6a6a), Color(hex: 0xff0000)]), startPoint: .leading, endPoint: .trailing)  // gradient background color.
                        ).cornerRadius(15)
                }.padding()
            }
        }
    }
    
    
    func getItemIndex(noteItem: NoteItem) -> Int {  // get the index of current item.
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
