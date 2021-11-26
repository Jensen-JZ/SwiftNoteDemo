//
//  NoteItemView.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/18.
//

import SwiftUI

struct NoteItemView: View {
    @Binding var noteItem: NoteItem
    @Binding var noteItems: [NoteItem]
    var body: some View {
        if !noteItem.isSwiped {
//            NavigationLink(destination: NoteView(noteItem: $noteItem, noteItems: $noteItems)) {
            NavigationLink(destination: NoteView(noteItems: $noteItems, id: noteItem.id)) {
                ItemBodyView(noteItem: $noteItem, noteItems: $noteItems)
            }
        } else {
            ItemBodyView(noteItem: $noteItem, noteItems: $noteItems)
            .onTapGesture {
//                withAnimation(.easeOut) {
                if noteItem.offset != 0 {
                    noteItem.offset = 0
                    noteItem.isSwiped = false
                }
//                }
                noteItem.isSwiped = false
            }
        }
    }
    
    
    
    
}

struct ItemBodyView: View {
    @Binding var noteItem: NoteItem
    @Binding var noteItems: [NoteItem]
    var body: some View {
        ZStack {
            if noteItem.offset == 0 {
                LinearGradient(gradient: .init(colors: [Color(hex: 0xff6a6a), Color(hex: 0xff0000)]), startPoint: .leading, endPoint: .trailing)
    //                .cornerRadius(15)
                    .opacity(0)
            } else {
                LinearGradient(gradient: .init(colors: [Color(hex: 0xff6a6a), Color(hex: 0xff0000)]), startPoint: .leading, endPoint: .trailing)
                    .opacity((-noteItem.offset/90) * 1)
            }
            
            // Delete Button...
            HStack {
                Spacer()
    
                Button(action: {
                    withAnimation(.easeIn) {deleteItem()}
                }) {
                    Image(systemName: "trash")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 50)
                }
            }
            
            VStack(spacing: 16) {
                // Note title
                HStack {
                    Text(noteItem.noteTitle)
                        .fontWeight(.semibold)
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                
                
                HStack {
                    Spacer()
                    
                    Text(noteItem.endTime)
                        .foregroundColor(.gray)
                }
            }
            .padding(10)
            .background(Color(hex: 0xf2f2f2))
//            .cornerRadius(15)
            .contentShape(Rectangle())
            .offset(x: noteItem.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
//            .onTapGesture {
//                withAnimation(.easeOut) {
//                    if noteItem.offset != 0 {
//                        noteItem.offset = 0
//                        noteItem.isSwiped = false
//                    }
//                }
//            }
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if noteItem.isSwiped {
                noteItem.offset = value.translation.width - 90
            } else {
                noteItem.offset = value.translation.width
            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
//        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                // Checking...
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    noteItem.offset = -1000
                    deleteItem()
                } else if -noteItem.offset > 50 {
                    // Updating is Swiping...
                    noteItem.isSwiped = true
                    noteItem.offset = -90
                } else {
                    noteItem.isSwiped = false
                    noteItem.offset = 0
                }
            } else {
                noteItem.isSwiped = false
                noteItem.offset = 0
            }
//        }
    }
    
    // Removing Item...
    func deleteItem() {
        noteItems.removeAll() { (noteItem) -> Bool in
            return self.noteItem.id == noteItem.id
        }
    }
}


extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 8) & 0xff) / 255,
            B: Double((hex >> 0) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}


//struct NoteItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteItemView()
//    }
//}
