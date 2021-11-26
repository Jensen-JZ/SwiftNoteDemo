//
//  NoteView.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/18.
//

import SwiftUI

//struct NoteView: View {
//    private var noteDemo = NoteDemo()
//    @State private var noteTitle = ""
//    @State private var endTime = ""
////    @State private var content = ""
//    var body: some View {
//        NavigationView {
//            VStack {
//                VStack {
//                    HStack {
//                        Text(noteTitle)
//                        Text(endTime)
//                    }
//                    Button(action: {
//
//                    }) {
//                        Text("打开")
//                    }
//                }
//                NavigationLink(destination: noteView()) {
//                    Text("笔记")
//                }
//                .navigationTitle("笔记目录")
////                Button(action: {
////                    let noteContent = noteDemo.readData()!
////                    noteTitle = noteContent.noteTitle
////                    endTime = noteContent.endTime
////                }) {
////                    Text("导入")
////                }
////                .padding()
//            }.onAppear {
//                let noteContent = noteDemo.readData()!
//                noteTitle = noteContent.noteTitle
//                endTime = noteContent.endTime
//            }
//        }
//    }
//}

struct NoteView: View {
    enum FocusField: Hashable {
        case field
    }
    
//    @Binding var noteItem: NoteItem
    @Binding var noteItems: [NoteItem]
    @State var id: String
    
    @State var index = 0
    
    @State var fullText: String = ""
    @State var tempText: String = ""
    @State var finishedTime: String = ""
    @FocusState var focusedField: FocusField?
    @State var noteData: [String: String] = [:]
    @State var isFine: Bool = false
    
    
    var noteDemo = NoteDemo()
    
    var body: some View {
        VStack {
            Text(noteItems[index].endTime).foregroundColor(Color.gray).font(.system(size: 14))
            TextEditor(text: $noteItems[index].content)
//                .navigationBarTitle(getTitle(title: fullText), displayMode: .inline)
                .navigationBarTitle(index == 0 ? "" : getTitle(title: noteItems[index].content), displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        UIApplication.shared.endEditing()
                        let uText = noteItems[index].content.trimmingCharacters(in: .whitespaces).trimmingCharacters(in: .newlines)
                        if tempText != noteItems[index].content {
                            tempText = noteItems[index].content
                            noteItems[index].endTime = getCurrentTime()
                        }
                        noteItems[index].noteTitle = getTitle(title: noteItems[index].content)
                        if uText != "" {
                            noteData = ["noteTitle": getTitle(title: noteItems[index].content), "endTime": noteItems[index].endTime, "content": noteItems[index].content]
//                            noteDemo.saveData(data: noteDemo.encodeJson(data: noteData), fileName: "NoteContent.json")
                            finishedNote(noteData: noteData)
                        } else {
                            noteItems[index].endTime = ""
                        }
                    }) {
                        Text("完成")
                    }
                )
                .focused($focusedField, equals: .field)
                .onAppear {
                    getIndex()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {  // Anything over 0.5 seems to work.
                        print("Called!")
                        self.focusedField = .field
//                        fullText = text
//                        finishedTime = time
                    }
                }
        
        }
    }
    
    func getTitle(title: String) -> String {
        let limit = 10
        var uTitle = title.trimmingCharacters(in: .whitespaces).trimmingCharacters(in: .newlines)
        if uTitle.count > limit {
            uTitle = String(uTitle[uTitle.startIndex..<uTitle.index(uTitle.startIndex, offsetBy: limit)]) + "..."
        }
        return uTitle
    }
    
    func getCurrentTime() -> String {
        let nowTimeStamp = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: nowTimeStamp)
    }
    
    func finishedNote(noteData: [String: String]) {
        print(noteData)
//        if !noteItems.contains(where: { $0.id == noteItem.id }) {
//            noteItems.append(noteItem)
//        }
    }
//    func getItemIndex() -> Int {
//        if id == "" {
//            let noteItem = NoteItem(noteTitle: "", endTime: "", content: "", isSwiped: false, offset: 0)
//            noteItems.append(noteItem)
//            return getIndex(id: noteItem.id)
//        } else { return getIndex(id: id) }
//    }
    
    func getIndex() {
        if id == "" {
            let noteItem = NoteItem(noteTitle: "", endTime: "", content: "", isSwiped: false, offset: 0)
            DispatchQueue.main.async {
                id = noteItem.id
            }
            noteItems.append(noteItem)
            
        }
        index = noteItems.firstIndex { (noteItem) -> Bool in
            return noteItem.id == id
        } ?? noteItems.count - 1
        print("items count: \(noteItems.count)")
    }
//    func getIndex(noteItem: NoteItem) -> Int {
//        return noteData.noteItems.firstIndex { (noteItem1) -> Bool in
//            return noteItem.id == noteItem1.id
//        } ?? 0
//    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
